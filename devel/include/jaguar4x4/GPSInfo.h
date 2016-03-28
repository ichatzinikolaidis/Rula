// Generated by gencpp from file jaguar4x4/GPSInfo.msg
// DO NOT EDIT!


#ifndef JAGUAR4X4_MESSAGE_GPSINFO_H
#define JAGUAR4X4_MESSAGE_GPSINFO_H


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
struct GPSInfo_
{
  typedef GPSInfo_<ContainerAllocator> Type;

  GPSInfo_()
    : header()
    , time(0)
    , date(0)
    , status(0)
    , latitude(0.0)
    , longitude(0.0)
    , vog(0.0)
    , cog(0.0)  {
    }
  GPSInfo_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , time(0)
    , date(0)
    , status(0)
    , latitude(0.0)
    , longitude(0.0)
    , vog(0.0)
    , cog(0.0)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int64_t _time_type;
  _time_type time;

   typedef int64_t _date_type;
  _date_type date;

   typedef int32_t _status_type;
  _status_type status;

   typedef double _latitude_type;
  _latitude_type latitude;

   typedef double _longitude_type;
  _longitude_type longitude;

   typedef double _vog_type;
  _vog_type vog;

   typedef double _cog_type;
  _cog_type cog;




  typedef boost::shared_ptr< ::jaguar4x4::GPSInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::jaguar4x4::GPSInfo_<ContainerAllocator> const> ConstPtr;

}; // struct GPSInfo_

typedef ::jaguar4x4::GPSInfo_<std::allocator<void> > GPSInfo;

typedef boost::shared_ptr< ::jaguar4x4::GPSInfo > GPSInfoPtr;
typedef boost::shared_ptr< ::jaguar4x4::GPSInfo const> GPSInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::jaguar4x4::GPSInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::jaguar4x4::GPSInfo_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::jaguar4x4::GPSInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::jaguar4x4::GPSInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::jaguar4x4::GPSInfo_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6e832839fcb0c679c10ac61202d410f9";
  }

  static const char* value(const ::jaguar4x4::GPSInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6e832839fcb0c679ULL;
  static const uint64_t static_value2 = 0xc10ac61202d410f9ULL;
};

template<class ContainerAllocator>
struct DataType< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "jaguar4x4/GPSInfo";
  }

  static const char* value(const ::jaguar4x4::GPSInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#this will be used as GPS sensor data message as Configuration from Dr Robot\n\
Header header 	    # std_msg header\n\
int64 time	    #hhmmss format\n\
int64 date	    #ddmmyy format\n\
int32 status	    # GPS status, 0 - fixed, valid, 1- differential -1 -- invalid\n\
float64 latitude    #latitude value, \"-\" --south, \"+\" -- north\n\
float64 longitude	    #longitude value, \"+\" --east, \"-\" -- west\n\
float64 vog		    # velocity over ground, m/s\n\
float64 cog		    #course over ground , radian\n\
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

  static const char* value(const ::jaguar4x4::GPSInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.time);
      stream.next(m.date);
      stream.next(m.status);
      stream.next(m.latitude);
      stream.next(m.longitude);
      stream.next(m.vog);
      stream.next(m.cog);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct GPSInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::jaguar4x4::GPSInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::jaguar4x4::GPSInfo_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "time: ";
    Printer<int64_t>::stream(s, indent + "  ", v.time);
    s << indent << "date: ";
    Printer<int64_t>::stream(s, indent + "  ", v.date);
    s << indent << "status: ";
    Printer<int32_t>::stream(s, indent + "  ", v.status);
    s << indent << "latitude: ";
    Printer<double>::stream(s, indent + "  ", v.latitude);
    s << indent << "longitude: ";
    Printer<double>::stream(s, indent + "  ", v.longitude);
    s << indent << "vog: ";
    Printer<double>::stream(s, indent + "  ", v.vog);
    s << indent << "cog: ";
    Printer<double>::stream(s, indent + "  ", v.cog);
  }
};

} // namespace message_operations
} // namespace ros

#endif // JAGUAR4X4_MESSAGE_GPSINFO_H