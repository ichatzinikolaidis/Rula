// Generated by gencpp from file jaguar4x4/MotorBoardInfo.msg
// DO NOT EDIT!


#ifndef JAGUAR4X4_MESSAGE_MOTORBOARDINFO_H
#define JAGUAR4X4_MESSAGE_MOTORBOARDINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace jaguar4x4
{
template <class ContainerAllocator>
struct MotorBoardInfo_
{
  typedef MotorBoardInfo_<ContainerAllocator> Type;

  MotorBoardInfo_()
    : header()
    , status(0)
    , temp1(0.0)
    , temp2(0.0)
    , temp3(0.0)
    , volMain(0.0)
    , vol12V(0.0)
    , vol5V(0.0)
    , dinput(0)
    , doutput(0)
    , ack(0)  {
    }
  MotorBoardInfo_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , status(0)
    , temp1(0.0)
    , temp2(0.0)
    , temp3(0.0)
    , volMain(0.0)
    , vol12V(0.0)
    , vol5V(0.0)
    , dinput(0)
    , doutput(0)
    , ack(0)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef uint32_t _status_type;
  _status_type status;

   typedef float _temp1_type;
  _temp1_type temp1;

   typedef float _temp2_type;
  _temp2_type temp2;

   typedef float _temp3_type;
  _temp3_type temp3;

   typedef float _volMain_type;
  _volMain_type volMain;

   typedef float _vol12V_type;
  _vol12V_type vol12V;

   typedef float _vol5V_type;
  _vol5V_type vol5V;

   typedef uint32_t _dinput_type;
  _dinput_type dinput;

   typedef uint32_t _doutput_type;
  _doutput_type doutput;

   typedef int32_t _ack_type;
  _ack_type ack;




  typedef boost::shared_ptr< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> const> ConstPtr;

}; // struct MotorBoardInfo_

typedef ::jaguar4x4::MotorBoardInfo_<std::allocator<void> > MotorBoardInfo;

typedef boost::shared_ptr< ::jaguar4x4::MotorBoardInfo > MotorBoardInfoPtr;
typedef boost::shared_ptr< ::jaguar4x4::MotorBoardInfo const> MotorBoardInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace jaguar4x4

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'jaguar4x4': ['/home/iordanis/Roula/src/motor_and_sensor_controllers/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "36cf7e6578c8ea959b3e6f20802b9a94";
  }

  static const char* value(const ::jaguar4x4::MotorBoardInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x36cf7e6578c8ea95ULL;
  static const uint64_t static_value2 = 0x9b3e6f20802b9a94ULL;
};

template<class ContainerAllocator>
struct DataType< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "jaguar4x4/MotorBoardInfo";
  }

  static const char* value(const ::jaguar4x4::MotorBoardInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#this is used for Motor Driver board info\n\
Header header 	  #std_msg header\n\
uint32 status	  # as described in motor driver board manual\n\
float32 temp1	  # temperature 1, internal chip temperature\n\
float32 temp2	  # driver channel 1 temperature\n\
float32 temp3	  # driver channel 2 temperature\n\
float32 volMain  # main power voltage, default is battery voltage\n\
float32 vol12V	  # 12V power \n\
float32 vol5V	  # 5V power\n\
uint32 dinput	  # digital input, not used now\n\
uint32 doutput	  # digital output, not used now\n\
int32 ack	  # 0- right command received(receive \"+\") -1 wrong(\"-\")\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::jaguar4x4::MotorBoardInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.status);
      stream.next(m.temp1);
      stream.next(m.temp2);
      stream.next(m.temp3);
      stream.next(m.volMain);
      stream.next(m.vol12V);
      stream.next(m.vol5V);
      stream.next(m.dinput);
      stream.next(m.doutput);
      stream.next(m.ack);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct MotorBoardInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::jaguar4x4::MotorBoardInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::jaguar4x4::MotorBoardInfo_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "status: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.status);
    s << indent << "temp1: ";
    Printer<float>::stream(s, indent + "  ", v.temp1);
    s << indent << "temp2: ";
    Printer<float>::stream(s, indent + "  ", v.temp2);
    s << indent << "temp3: ";
    Printer<float>::stream(s, indent + "  ", v.temp3);
    s << indent << "volMain: ";
    Printer<float>::stream(s, indent + "  ", v.volMain);
    s << indent << "vol12V: ";
    Printer<float>::stream(s, indent + "  ", v.vol12V);
    s << indent << "vol5V: ";
    Printer<float>::stream(s, indent + "  ", v.vol5V);
    s << indent << "dinput: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.dinput);
    s << indent << "doutput: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.doutput);
    s << indent << "ack: ";
    Printer<int32_t>::stream(s, indent + "  ", v.ack);
  }
};

} // namespace message_operations
} // namespace ros

#endif // JAGUAR4X4_MESSAGE_MOTORBOARDINFO_H
