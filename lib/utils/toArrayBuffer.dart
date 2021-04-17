import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

class EndianConst {
  static int littleEndian = 0;
  static int bigEndian = 1;
}

class ByteArraySize {
  static int _sizeOfBoolean = 1; //SIZE_OF_BOOLEAN = 1;

  static int _sizeOfInt8 = 1; //SIZE_OF_INT8 = 1;

  static int _sizeOfInt16 = 2; //SIZE_OF_INT16 = 2;

  static int _sizeOfInt32 = 4; //SIZE_OF_INT32 = 4;

  static int _sizeOfInt64 = 8; //SIZE_OF_INT64 = 8;

  static int _sizeOfUint8 = 1; //SIZE_OF_UINT8 = 1;

  static int _sizeOfUint16 = 2; //SIZE_OF_UINT16 = 2;

  static int _sizeOfUint32 = 4; //SIZE_OF_UINT32 = 4;

  static int _sizeOfUint64 = 8; //SIZE_OF_UINT64 = 8;

  static int _sizeOfFloat32 = 4; //SIZE_OF_FLOAT32 = 4;

  static int _sizeOfFloat64 = 8; //SIZE_OF_FLOAT64 = 8;
}

/*
 * ByteArray 类提供用于优化读取、写入以及处理二进制数据的方法和属性。
 * 注意：ByteArray 类适用于需要在字节层访问数据的高级开发人员。
 */
class ByteArray {
  int bufferExtSize = 0; //Buffer expansion size
  ByteData data;
  Uint8List _bytes;
  int _position = 0;

  /*
     *
     * 已经使用的字节偏移量
     * @protected
     * @type {number}
     * @memberOf ByteArray
     */
  int write_position = 0;

  Endian $endian = Endian.big;

  /// 默认一个byteArray生成100个字节大小
  ByteArray(Uint8List byteList, int bufferExtSize) {
    this.bufferExtSize = bufferExtSize;
    if (this.bufferExtSize < 100) {
      this.bufferExtSize = 100;
    }
    this.write_position = 0;
    this._position = 0;
    this._bytes = byteList;
    this.data = ByteData.view(byteList.buffer);
    this.$endian = Endian.big;
  }

  /// 创建一个主要是用来写的ByteArray
  factory ByteArray.createWriteBytes([int bufferExtSize = 2000]) {
    if (bufferExtSize < 0) {
      bufferExtSize = 0;
    }
    ByteArray bytes =
        new ByteArray(new Uint8List(bufferExtSize), bufferExtSize);
    return bytes;
  }

  /// 创建一个只读对应的字节的ByteArray
  factory ByteArray.createReadBytes(Uint8List byteList) {
    ByteArray bytes = new ByteArray(byteList, byteList.lengthInBytes);
    return bytes;
  }

  /*
     * 可读的剩余字节数
     * @returns
     * @memberOf ByteArray
     */
  getReadAvailable() {
    return this.write_position - this._position;
  }

  ByteBuffer getBuffer() {
//        return this.data.buffer.slice(0, this.write_position);
  }

  ByteBuffer getRawBuffer() {
    return this.data.buffer;
  }

  Uint8List getBytes() {
    return this._bytes;
  }

  Uint8List getWriteBytes() {
    return this._bytes.sublist(0, this._position);
  }

  ByteData getDataView() {
    return this.data;
  }

  int getBufferOffset() {
    return this.data.offsetInBytes;
  }

  /*
     * 将文件指针的当前位置（以字节为单位）移动或返回到 ByteArray 对象中。下一次调用读取方法时将在此位置开始读取，或者下一次调用写入方法时将在此位置开始写入。
     */
  int getPosition() {
    return this._position;
  }

  setPosition(int value) {
    this._position = value;
    if (value > this.write_position) {
      this.write_position = value;
    }
  }

  /*
     * ByteArray 对象的长度（以字节为单位）。
     * 如果将长度设置为大于当前长度的值，则用零填充字节数组的右侧。
     * 如果将长度设置为小于当前长度的值，将会截断该字节数组。
     */
  int getLength() {
    return this._position;
  }

  setLength(int value) {
    this.write_position = value;
    if (this.data.lengthInBytes > value) {
      this._position = value;
    }
    this._validateBuffer(value);
  }

  _validateBuffer(int value) {
    if (this.data.lengthInBytes < value) {
      Uint8List tmp = new Uint8List(value + 100);
      tmp.addAll(this._bytes);
      this._bytes = tmp;
      this.data = ByteData.view(tmp.buffer);
    }
  }

  /*
     * 可从字节数组的当前位置到数组末尾读取的数据的字节数。
     * 每次访问 ByteArray 对象时，将 bytesAvailable 属性与读取方法结合使用，以确保读取有效的数据。
     */
  int getBytesAvailable() {
    return this.data.lengthInBytes - this._position;
  }

  /*
     * 清除字节数组的内容，并将 length 和 position 属性重置为 0。
     */
  void clear() {
    this._bytes = new Uint8List(this.bufferExtSize);
    this.data = ByteData.view(this._bytes.buffer);
    this._position = 0;
    this.write_position = 0;
  }

  /*
     * 从字节流中读取布尔值。读取单个字节，如果字节非零，则返回 true，否则返回 false
     * @return 如果字节不为零，则返回 true，否则返回 false
     */
  bool readBoolean() {
//        if (this.validate(ByteArraySize._sizeOfBoolean)) return !! this._bytes[];
    return this.data.getInt8(this._position++) == 1;
  }

  /*
     * 从字节流中读取带符号的字节
     * @return 介于 -128 和 127 之间的整数
     */
  int readByte() {
    if (this.validate(ByteArraySize._sizeOfInt8))
      return this.data.getInt8(this._position++);
    return 0;
  }

  /*
     * 从字节流中读取 length 参数指定的数据字节数。从 offset 指定的位置开始，将字节读入 bytes 参数指定的 ByteArray 对象中，并将字节写入目标 ByteArray 中
     * @param bytes 要将数据读入的 ByteArray 对象
     * @param offset bytes 中的偏移（位置），应从该位置写入读取的数据
     * @param length 要读取的字节数。默认值 0 导致读取所有可用的数据
     */
  void readBytes(ByteArray bytes, [int offset = 0, length = 0]) {
    if (bytes == null) {
      //由于bytes不返回，所以new新的无意义
      return;
    }
    int pos = this._position;
    int available = this.getBytesAvailable() - pos;
    if (available < 0) {
      return;
    }
    if (length == 0) {
      length = available;
    } else if (length > available) {
      return;
    }
  }

  /*
     * 从字节流中读取一个 IEEE 754 双精度（64 位）浮点数
     * @return 双精度（64 位）浮点数
     */
  double readDouble() {
    if (this.validate(ByteArraySize._sizeOfFloat64)) {
      double value = this.data.getFloat64(this._position, this.$endian);
      this._position += ByteArraySize._sizeOfFloat64;
      return value;
    }
    return 0;
  }

  /*
     * 从字节流中读取一个 IEEE 754 单精度（32 位）浮点数
     * @return 单精度（32 位）浮点数
     */
  double readFloat() {
    if (this.validate(ByteArraySize._sizeOfFloat32)) {
      double value = this.data.getFloat32(this._position, this.$endian);
      this._position += ByteArraySize._sizeOfFloat32;
      return value;
    }
    return 0;
  }

  /*
     * 从字节流中读取一个带符号的 32 位整数
     * @return 介于 -2147483648 和 2147483647 之间的 32 位带符号整数
     */
  int readInt() {
    if (this.validate(ByteArraySize._sizeOfInt32)) {
      int value = this.data.getInt32(this._position, this.$endian);
      this._position += ByteArraySize._sizeOfInt32;
      return value;
    }
    return 0;
  }

  /*
     * 从字节流中读取一个带符号的 16 位整数
     * @return 介于 -32768 和 32767 之间的 16 位带符号整数
     */
  int readShort() {
    if (this.validate(ByteArraySize._sizeOfInt16)) {
      int value = this.data.getInt16(this._position, this.$endian);
      this._position += ByteArraySize._sizeOfInt16;
      return value;
    }
    return 0;
  }

  /*
     * 从字节流中读取无符号的字节
     * @return 介于 0 和 255 之间的无符号整数
     */
  int readUnsignedByte() {
    if (this.validate(ByteArraySize._sizeOfUint8))
      return this._bytes[this._position++];
    return 0;
  }

  /*
     * 从字节流中读取一个无符号的 32 位整数
     * @return 介于 0 和 4294967295 之间的 32 位无符号整数
     */
  int readUnsignedInt() {
    if (this.validate(ByteArraySize._sizeOfUint32)) {
      int value = this.data.getUint32(this._position, this.$endian);
      this._position += ByteArraySize._sizeOfUint32;
      return value;
    }
    return 0;
  }

  /*
     * 从字节流中读取一个无符号的 16 位整数
     * @return 介于 0 和 65535 之间的 16 位无符号整数
     */
  int readUnsignedShort() {
    if (this.validate(ByteArraySize._sizeOfUint16)) {
      int value = this.data.getUint16(this._position, this.$endian);
      this._position += ByteArraySize._sizeOfUint16;
      return value;
    }
    return 0;
  }

  /*
     * 从字节流中读取一个 UTF-8 字符串。假定字符串的前缀是无符号的短整型（以字节表示长度）
     * @return UTF-8 编码的字符串
     */
  String readUTF() {
    int length = this.readUnsignedShort();
    if (length > 0) {
      return this.readUTFBytes(length);
    } else {
      return "";
    }
  }

  /*
     * 从字节流中读取一个由 length 参数指定的 UTF-8 字节序列，并返回一个字符串
     * @param length 指明 UTF-8 字节长度的无符号短整型数
     * @return 由指定长度的 UTF-8 字节组成的字符串
     */
  String readUTFBytes(int length) {
    if (!this.validate(length)) {
      return "";
    }
    ByteData data = this.data;
    Uint8List bytes = Uint8List.view(
        data.buffer, data.offsetInBytes + this._position, length);
    this._position += length;
    return this._decodeUTF8(bytes);
  }

  /// 写入布尔值。根据 value 参数写入单个字节。如果为 true，则写入 1，如果为 false，则写入 0
  /// @param value 确定写入哪个字节的布尔值。如果该参数为 true，则该方法写入 1；如果该参数为 false，则该方法写入 0
  void writeBoolean(bool value) {
    this.validateBuffer(ByteArraySize._sizeOfBoolean);
    if (value) {
      this._bytes[this._position++] = 1;
    } else {
      this._bytes[this._position++] = 0;
    }
  }

  /// 在字节流中写入一个字节
  /// 使用参数的低 8 位。忽略高 24 位
  /// @param value 一个 32 位整数。低 8 位将被写入字节流
  void writeByte(int value) {
    this.validateBuffer(ByteArraySize._sizeOfInt8);
    this._bytes[this._position++] = value & 0xff;
  }

  /*
     * 将指定字节数组 bytes（起始偏移量为 offset，从零开始的索引）中包含 length 个字节的字节序列写入字节流
     * 如果省略 length 参数，则使用默认长度 0；该方法将从 offset 开始写入整个缓冲区。如果还省略了 offset 参数，则写入整个缓冲区
     * 如果 offset 或 length 超出范围，它们将被锁定到 bytes 数组的开头和结尾
     * @param bytes ByteArray 对象
     * @param offset 从 0 开始的索引，表示在数组中开始写入的位置
     * @param length 一个无符号整数，表示在缓冲区中的写入范围
     */
  void writeBytes(ByteArray bytes, {int offset = 0, int length = 0}) {
    int writeLength;
    if (offset < 0) {
      return;
    }
    if (length < 0) {
      return;
    } else if (length == 0) {
      writeLength = bytes.getLength() - offset;
    } else {
      writeLength = min(bytes.getLength() - offset, length);
    }
    if (writeLength > 0) {
      this.validateBuffer(writeLength);
      this._bytes.setRange(
          this._position, this._position + bytes.getLength(), bytes.getBytes());
      this._position = this._position + writeLength;
    }
  }

  /*
     * 在字节流中写入一个 IEEE 754 双精度（64 位）浮点数
     * @param value 双精度（64 位）浮点数
     */
  void writeDouble(double value) {
    this.validateBuffer(ByteArraySize._sizeOfFloat64);
    this.data.setFloat64(this._position, value, this.$endian);
    this._position += ByteArraySize._sizeOfFloat64;
  }

  /*
     * 在字节流中写入一个 IEEE 754 单精度（32 位）浮点数
     * @param value 单精度（32 位）浮点数
     */
  void writeFloat(double value) {
    this.validateBuffer(ByteArraySize._sizeOfFloat32);
    this.data.setFloat32(this._position, value, this.$endian);
    this._position += ByteArraySize._sizeOfFloat32;
  }

  /*
     * 在字节流中写入一个带符号的 32 位整数
     * @param value 要写入字节流的整数
     */
  void writeInt(int value) {
    this.validateBuffer(ByteArraySize._sizeOfInt32);
    this.data.setInt32(this._position, value, this.$endian);
    this._position += ByteArraySize._sizeOfInt32;
  }

  void writeLong(int value) {
    this.validateBuffer(ByteArraySize._sizeOfInt64);
    this.data.setInt64(this._position, value, this.$endian);
    this._position += ByteArraySize._sizeOfInt64;
  }

  /*
     * 在字节流中写入一个 16 位整数。使用参数的低 16 位。忽略高 16 位
     * @param value 32 位整数，该整数的低 16 位将被写入字节流
     */
  void writeShort(int value) {
    this.validateBuffer(ByteArraySize._sizeOfInt16);
    this.data.setInt16(this._position, value, this.$endian);
    this._position += ByteArraySize._sizeOfInt16;
  }

  /*
     * 在字节流中写入一个无符号的 32 位整数
     * @param value 要写入字节流的无符号整数
     */
  void writeUnsignedInt(int value) {
    this.validateBuffer(ByteArraySize._sizeOfUint32);
    this.data.setUint32(this._position, value, this.$endian);
    this._position += ByteArraySize._sizeOfUint32;
  }

  /*
     * 在字节流中写入一个无符号的 16 位整数
     * @param value 要写入字节流的无符号整数
     */
  void writeUnsignedShort(int value) {
    this.validateBuffer(ByteArraySize._sizeOfUint16);
    this.data.setUint16(this._position, value, this.$endian);
    this._position += ByteArraySize._sizeOfUint16;
  }

  /*
     * 将 UTF-8 字符串写入字节流。先写入以字节表示的 UTF-8 字符串长度（作为 16 位整数），然后写入表示字符串字符的字节
     * @param value 要写入的字符串值
     */
  void writeUTF(String value) {
    List<int> utf8bytes = utf8.encode(value);
    int length = utf8bytes.length;
    this.validateBuffer(ByteArraySize._sizeOfUint16 + length);
    this.data.setUint16(this._position, length, this.$endian);
    this._position += ByteArraySize._sizeOfUint16;
    this._writeUint8Array(utf8bytes, false);
  }

  /*
     * 将 UTF-8 字符串写入字节流。类似于 writeUTF() 方法，但 writeUTFBytes() 不使用 16 位长度的词为字符串添加前缀
     * @param value 要写入的字符串值
     */
  void writeUTFBytes(String value) {
    this._writeUint8Array(this._encodeUTF8(value));
  }

  String toString() {
    return "[ByteArray] length:${this.getLength()} , bytesAvailable:${this.getBytesAvailable()}";
  }

  /*
     * @private
     * 将 Uint8Array 写入字节流
     * @param bytes 要写入的Uint8Array
     * @param validateBuffer
     */
  void _writeUint8Array(Uint8List bytes, [bool validateBuffer = true]) {
    int pos = this._position;
    int npos = pos + bytes.length;
    if (validateBuffer) {
      this.validateBuffer(npos);
    }
    this._bytes.setRange(pos, npos, bytes);
    this._position = npos;
  }

  /*
     * @param len
     * @returns
     * @private
     */
  bool validate(int len) {
    int bl = this._bytes.length;
    if (bl > 0 && this._position + len <= bl) {
      return true;
    } else {
      return false;
    }
  }

  /*  PRIVATE METHODS   
     * @private
     * @param len
     * @param needReplace
     */
  void validateBuffer(int len) {
    this.write_position = len > this.write_position ? len : this.write_position;
    len += this._position;
    this._validateBuffer(len);
  }

  /*
     * @private
     * UTF-8 Encoding/Decoding
     */
  Uint8List _encodeUTF8(String str) {
    int pos = 0;
    List<int> codePoints = this.stringToCodePoints(str);
    List<int> outputBytes = [];

    while (codePoints.length > pos) {
      int code_point = codePoints[pos++];

      if (this._inRange(code_point, 0xD800, 0xDFFF)) {
        this.encoderError(code_point);
      } else if (this._inRange(code_point, 0x0000, 0x007f)) {
        outputBytes.add(code_point);
      } else {
        int count, offset;
        if (this._inRange(code_point, 0x0080, 0x07FF)) {
          count = 1;
          offset = 0xC0;
        } else if (this._inRange(code_point, 0x0800, 0xFFFF)) {
          count = 2;
          offset = 0xE0;
        } else if (this._inRange(code_point, 0x10000, 0x10FFFF)) {
          count = 3;
          offset = 0xF0;
        }

        outputBytes.add(this._div(code_point, pow(64, count)) + offset);

        while (count > 0) {
          int temp = this._div(code_point, pow(64, count - 1));
          outputBytes.add(0x80 + (temp % 64));
          count -= 1;
        }
      }
    }
    return Uint8List.fromList(outputBytes);
  }

  /*
     * @param data
     * @returns
     */
  String _decodeUTF8(Uint8List data) {
    return utf8.decode(data);
  }

  /*
     * @private
     *
     * @param code_point
     */
  encoderError(int code_point) {}

  /*
     * @private
     * @param a
     * @param min
     * @param max
     */
  _inRange(int a, int min, int max) {
    return min <= a && a <= max;
  }

  /*
     * @private
     * @param n
     * @param d
     */
  int _div(int n, int d) {
    double result = n / d;
    return result.floor();
  }

  /*
     * @private
     * @param string
     */
  List<int> stringToCodePoints(String string) {
    /** @type {Array.<number>} */
    List<int> cps = [];
    // Based on http://www.w3.org/TR/WebIDL/#idl-DOMString
    var i = 0, n = string.length;
    while (i < string.length) {
      var c = string.codeUnitAt(i);
      if (!this._inRange(c, 0xD800, 0xDFFF)) {
        cps.add(c);
      } else if (this._inRange(c, 0xDC00, 0xDFFF)) {
        cps.add(0xFFFD);
      } else {
        // (inRange(c, 0xD800, 0xDBFF))
        if (i == n - 1) {
          cps.add(0xFFFD);
        } else {
          var d = string.codeUnitAt(i + 1);
          if (this._inRange(d, 0xDC00, 0xDFFF)) {
            var a = c & 0x3FF;
            var b = d & 0x3FF;
            i += 1;
            cps.add(0x10000 + (a << 10) + b);
          } else {
            cps.add(0xFFFD);
          }
        }
      }
      i += 1;
    }
    return cps;
  }
}
