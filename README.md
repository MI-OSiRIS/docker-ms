# Periscope: Measurement Store (MS)

The Periscope MS is an instance of UNIS (see [Docker UNIS](https://cloud.docker.com/u/miosiris/repository/docker/miosiris/unis)) that exposes the `/data` and `/event` REST endpoints.  While UNIS runs on port 8888, this container is configured to start the MS service on port 8889.

## Configuration

The configuration is identical to that of [Docker UNIS](https://cloud.docker.com/u/miosiris/repository/docker/miosiris/unis).  The only difference is that the configuration file is located at `/etc/periscope/ms.cfg`

