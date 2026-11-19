Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795047351;
	b=BZcRo+7TqpdLZW8zVvcutofiIIvgAGPd3ZSpRipv7zyITEVK2EoKaLw3wu6V8jHlTEog
	 lfuIi9YugQJEZqBTIKLnS7TLJGeyqI76qSxX0Oqdc1Zg01MGI5eclkA5rllCgFCHZoY9V
	 uCeSsXkm4GOd/S1mNe2Px3s5qcRpX1yjC4syCLwwMBMWC9CKfEWYrDJq4V4JqE5/Wqdey
	 X309FxKGpaaCn6lZ3GmQitRv9VeZ65PXdTYDBS/IE9mdmkXy+XeWNNKQlb95NNhIxbnG2
	 Gyr0RJwXY+KhQcF7AuDOWYPvlgeonfMizqGGGvSVIGLWGoIVIpB8whr8sOg94y7xSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795047351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8hY+l8VaXXk8kWGmVPripTY580SJ0WHm9yq2fDXYnQ8=;
	b=c8R9d0nxcU5zpQS5fow1UPOrT9YNmSQBsoB+LqVuAdali1anBiPkGfTNe/qgaoONIuwb
	 B3DbWK5GQSB/Z2r2eAIShhIWZ49Z5TpIih9xq+FxI2X0ifU2oNajbeZAiV7PsVPANlNxS
	 xV7qylYg0m/hWDoQ3lBuPU7pVd2r2wNmz6T/xLRSPPjg+kvKmuwlYQ8Ud+Pipr+Hyy4SO
	 Ed4DZMu9lQNghvqzKhFw4l6/gczeTICnM2uZXhuhb/fqtcCdl6paS5apEHWvI/rf58gxI
	 V84IvdNlSTo3vk4pxmpALDr/bx1/Af79BT8BuqbH/G10nEfUo+EK1Hvg37S47xso8dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="lJ/Hxq55";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1C606A32F
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A1C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lJ/Hxq55
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so896211a91.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795047349; x=1795652149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hY+l8VaXXk8kWGmVPripTY580SJ0WHm9yq2fDXYnQ8=;
        b=lJ/Hxq558XJT8GgxxGifk0Ga2SGBsvG9sNxxT2OZIOMjozy4ocWjxmiG1XtkBYV5A1
         T32xaeorCEEKbvipo2VrE2cykUAYOzgOM+ydKaFM+x8p+TYrM5U8Nr5E2htHqhyoB80U
         6fTBQULcN7hi2ol7OMDvXIKA3Oc/cWwwfxvzQHYtYwNVOk9VFVGW3Hd/loH+52Ay5t9B
         HM1zhYNoHn2Cxlyef7vpzEkYEBLAAWiABezsoKf7owD7IjXUWyenvFYAEaLv1dQ1T18T
         t1U0WbqwjBtod6ixiOhm+2QcXgmFYb7AD8wQ7IIUheWFiL5q5Ryeb5HE7Eidg0J/34kS
         o51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047349; x=1795652149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hY+l8VaXXk8kWGmVPripTY580SJ0WHm9yq2fDXYnQ8=;
        b=T7mpdPlHIel+T1l5UrpmsXEyri0rcYYRYxhIeXkjSUd4/W27TkxP08irIz2/DrYCiK
         beFNvtBP1yrKT6nxOyaBpJafpxXtXiiDHQG/sW+AabmqDGEBljbUtXpmpGeVGf+KVgIf
         K8YzTuUkXok1chtefCejC8freneQNtRvKtz4I9CGiWkcqDPDnlWyhrau1Y4dZS0IgEyW
         hLY9cHFqtD71pwgmeLYQ8xv1BHjh/x04ku4409XsyHy2O0dc90HGHClWI2JiL4ECqROJ
         uhDKONrtBOZ6exZ0PBDwSCYDRiCEHAcmax/PweA8K1zz/lPKZoaO9V2iojxc9yQ2LJ5d
         pvuQ==
X-Gm-Message-State: APuU4Z/w17sPgm/s/psMO9a5dcQCvAceVHqhglpuVKJLgNAWLu6TbjGs
	QlQ8BDHp57MwsoQPqPbrOnOxRKmkPe98jNlDcC2u1nFene8PFixbbFoZxt0fsJb2pg1kR8R407q
	39xVpV50=
X-Gm-Gg: AZFdTZdPFzyT/bBW6JQiZWIcxNgtzsTbnHImu5QM5HMCqxK7nFqKJMVxs2CuOVmTqe2
	atjjM1+MkCVPtVmk83vjz1zNIZ3K+IXLMVDNlukDGeLQcCX8jMuDQwvWraiMWYLQ/TUvxJdQHmf
	mTKUjPzy36TKYxmzNyuTlqtwAp/OSFE4I+vZKIaGwku7AENOIoieP0OpunS68fzsurceyDiL3d9
	M1pczZ9lc67VSkR0Q8Pps8g2eufDrffU9j+EmCFdHrhCwL8qkT7JO+dObhAKoh0IAs1KyYGLZmU
	m1d7MMJN0qsl6NYiLbe+uNxNyC1JbZq33iRDpxECCFW+acoZZL7O+HShASKb/x2+PLZPsATTAcB
	C3VIgIWR2pJKFNux5tOpXyBvZzWUBPX+hdYC6D5OqYjmOenTYlYKz+cDy5M+NvHEogAGuE/MMsw
	/W1nr+qT5+sw4jTbBh6KkNxXZL4AuRdZC9a+9IWG75MOE+J5QMaTtJTlYwBrR9/zTQkeBVc4HkA
	E6v4pR82IqT46w9plVqgJC0q4cO1RDVwKx8iJ3ICDzymg1g8qRSK7EKRMHs1bt3tMO3DB0m1Ebj
	v5x067IYEythKf8kcje0eZ4CERQjsmTF0R2ynqc9NPlGySIAdUJz03mvlbypef1C3V6q73xj+by
	94UGDYaoKULgGpI0=
X-Received: by 2002:a17:90b:3888:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b3d07e3b43mr4290982a91.61.1795047347832;
        Wed, 18 Nov 2026 16:15:47 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b62e7sm444278a91.11.2026.11.18.16.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:15:47 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next 4/5] lib/bpf: require libbpf and remove legacy ELF loader
Date: Wed, 18 Nov 2026 16:15:08 -0800
Message-ID: <20261119001539.2868072-5-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119001539.2868072-1-stephen@networkplumber.org>
References: <20261119001539.2868072-1-stephen@networkplumber.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iproute2 has its own eBPF ELF loader from before libbpf existed.
When built with libbpf that loader is bypassed, so there is no
reason to keep both.

Make libbpf mandatory in configure and remove the HAVE_LIBBPF and
HAVE_ELF conditionals. The --libbpf_force option is removed;
configure now fails outright if libbpf is missing or too old.
libelf is no longer probed for directly, it comes in as a libbpf
dependency and is only named explicitly when linking libbpf
statically.

libbpf 1.0 was released in 2022. Require it and remove the
compatibility code for older versions:
 - bpf_program__title() fallback for bpf_program__section_name()
 - version check for kernel_log_level in open options
 - version check gating BPF socket-local storage support in ss

With libbpf 1.0, bpf_object__open_file() returns NULL on error,
so check for that instead of using libbpf_get_error().

libbpf 1.0 also refuses to open an object that has a "maps"
section, so the code handling struct bpf_elf_map defined maps on
the libbpf path can no longer be reached. Remove the parsing of
that section and everything that depended on it: pinning by
PIN_OBJECT_NS and PIN_GLOBAL_NS, the bpf_pinning database,
map-in-map setup, and tail call maps filled from "id/key" section
names.

struct bpf_elf_map itself stays, reduced to the five fields that
bpf_graft_map() reads back from /proc/self/fdinfo for its pinned
map self-check. It no longer describes any on-disk layout.

Remove the legacy examples and update the example in tc-bpf(8) to
BTF defined maps.

The remaining useful functions from bpf_legacy.c have been moved
to the new file bpf_util.c.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 configure                            |  107 +-
 etc/iproute2/bpf_pinning             |    6 -
 examples/bpf/README                  |   18 +-
 examples/bpf/bpf_map_in_map.c        |    4 +-
 examples/bpf/bpf_shared.c            |   14 +-
 examples/bpf/legacy/bpf_cyclic.c     |   35 -
 examples/bpf/legacy/bpf_graft.c      |   66 -
 examples/bpf/legacy/bpf_map_in_map.c |   56 -
 examples/bpf/legacy/bpf_shared.c     |   53 -
 examples/bpf/legacy/bpf_tailcall.c   |  117 -
 include/bpf_api.h                    |    7 +-
 include/bpf_elf.h                    |   35 +-
 include/bpf_util.h                   |   23 +-
 include/sha1.h                       |   18 -
 ip/iplink.c                          |    4 -
 lib/Makefile                         |   10 +-
 lib/bpf_glue.c                       |   15 +-
 lib/bpf_legacy.c                     | 3093 --------------------------
 lib/bpf_libbpf.c                     |  259 +--
 lib/bpf_util.c                       | 1093 +++++++++
 lib/sha1.c                           |  108 -
 man/man8/ip-link.8.in                |    5 +-
 man/man8/tc-bpf.8                    |   60 +-
 misc/ss.c                            |   30 -
 24 files changed, 1171 insertions(+), 4065 deletions(-)
 delete mode 100644 etc/iproute2/bpf_pinning
 delete mode 100644 examples/bpf/legacy/bpf_cyclic.c
 delete mode 100644 examples/bpf/legacy/bpf_graft.c
 delete mode 100644 examples/bpf/legacy/bpf_map_in_map.c
 delete mode 100644 examples/bpf/legacy/bpf_shared.c
 delete mode 100644 examples/bpf/legacy/bpf_tailcall.c
 delete mode 100644 include/sha1.h
 delete mode 100644 lib/bpf_legacy.c
 create mode 100644 lib/bpf_util.c
 delete mode 100644 lib/sha1.c

diff --git a/configure b/configure
index ebc0d97a..71a73bca 100755
--- a/configure
+++ b/configure
@@ -12,7 +12,7 @@ CONFIG=config.mk
 
 # Make a temp directory in build tree.
 TMPDIR=$(mktemp -d config.XXXXXX)
-trap 'status=$?; rm -rf $TMPDIR; exit $status' EXIT HUP INT QUIT TERM
+trap 'status=$?; rm -rf $TMPDIR; [ $status -ne 0 ] && rm -f $CONFIG; exit $status' EXIT HUP INT QUIT TERM
 
 check_toolchain()
 {
@@ -215,27 +215,14 @@ EOF
     rm -f $TMPDIR/ipsettest.c $TMPDIR/ipsettest
 }
 
-check_elf()
-{
-    if ${PKG_CONFIG} libelf --exists; then
-	echo "HAVE_ELF:=y" >>$CONFIG
-	echo "yes"
-
-	echo 'CFLAGS += -DHAVE_ELF' "$(${PKG_CONFIG} libelf --cflags)" >> $CONFIG
-	echo 'LDLIBS += ' "$(${PKG_CONFIG} libelf --libs)" >>$CONFIG
-    else
-	echo "no"
-    fi
-}
-
 have_libbpf_basic()
 {
     cat >$TMPDIR/libbpf_test.c <<EOF
 #include <bpf/libbpf.h>
+#if LIBBPF_MAJOR_VERSION < 1
+#error libbpf 1.0 or later is required
+#endif
 int main(int argc, char **argv) {
-    bpf_program__set_autoload(NULL, false);
-    bpf_map__ifindex(NULL);
-    bpf_map__set_pin_path(NULL, NULL);
     bpf_object__open_file(NULL, NULL);
     return 0;
 }
@@ -248,46 +235,13 @@ EOF
     return $ret
 }
 
-have_libbpf_sec_name()
-{
-    cat >$TMPDIR/libbpf_sec_test.c <<EOF
-#include <bpf/libbpf.h>
-int main(int argc, char **argv) {
-    void *ptr;
-    bpf_program__section_name(NULL);
-    return 0;
-}
-EOF
-
-    $CC -o $TMPDIR/libbpf_sec_test $TMPDIR/libbpf_sec_test.c $LIBBPF_CFLAGS $LIBBPF_LDLIBS >/dev/null 2>&1
-    local ret=$?
-
-    rm -f $TMPDIR/libbpf_sec_test.c $TMPDIR/libbpf_sec_test
-    return $ret
-}
-
-check_force_libbpf_on()
-{
-    # if set LIBBPF_FORCE=on but no libbpf support, just exist the config
-    # process to make sure we don't build without libbpf.
-    if [ "$LIBBPF_FORCE" = on ]; then
-        echo "	LIBBPF_FORCE=on set, but couldn't find a usable libbpf"
-        exit 1
-    fi
-}
-
 check_libbpf()
 {
-    # if set LIBBPF_FORCE=off, disable libbpf entirely
-    if [ "$LIBBPF_FORCE" = off ]; then
-        echo "no"
-        return
-    fi
-
     if ! ${PKG_CONFIG} libbpf --exists && [ -z "$LIBBPF_DIR" ] ; then
         echo "no"
-        check_force_libbpf_on
-        return
+        echo "	libbpf is required, install libbpf-dev or libbpf-devel"
+        echo "	or use --libbpf_dir to point to a libbpf build"
+        exit 1
     fi
 
     if [ $(uname -m) = x86_64 ]; then
@@ -308,31 +262,16 @@ check_libbpf()
 
     if ! have_libbpf_basic; then
         echo "no"
-        echo "	libbpf version $LIBBPF_VERSION is too low, please update it to at least 0.1.0"
-        check_force_libbpf_on
-        return
-    else
-        echo "HAVE_LIBBPF:=y" >> $CONFIG
-        echo 'CFLAGS += -DHAVE_LIBBPF ' $LIBBPF_CFLAGS >> $CONFIG
-        echo "CFLAGS += -DLIBBPF_VERSION=\\\"$LIBBPF_VERSION\\\"" >> $CONFIG
-	LIBBPF_MAJOR=$(IFS="."; set $LIBBPF_VERSION; echo $1)
-	LIBBPF_MINOR=$(IFS="."; set $LIBBPF_VERSION; echo $2)
-	if [ "$LIBBPF_MAJOR" -eq 0 -a "$LIBBPF_MINOR" -lt 7 ]; then
-	    # Newer libbpf versions provide these defines in the bpf/libbpf_version.h header.
-            echo "CFLAGS += -DLIBBPF_MAJOR_VERSION=$LIBBPF_MAJOR -DLIBBPF_MINOR_VERSION=$LIBBPF_MINOR" >> $CONFIG
-	fi
-        echo 'LDLIBS += ' $LIBBPF_LDLIBS >> $CONFIG
-
-        if [ -z "$LIBBPF_DIR" ]; then
-            echo "CFLAGS += -DLIBBPF_DYNAMIC" >> $CONFIG
-        fi
+        echo "	libbpf version $LIBBPF_VERSION is too low, please update it to at least 1.0"
+        exit 1
     fi
 
-    # bpf_program__title() is deprecated since libbpf 0.2.0, use
-    # bpf_program__section_name() instead if we support
-    if have_libbpf_sec_name; then
-        echo "HAVE_LIBBPF_SECTION_NAME:=y" >> $CONFIG
-        echo 'CFLAGS += -DHAVE_LIBBPF_SECTION_NAME ' >> $CONFIG
+    echo 'CFLAGS += ' $LIBBPF_CFLAGS >> $CONFIG
+    echo "CFLAGS += -DLIBBPF_VERSION=\\\"$LIBBPF_VERSION\\\"" >> $CONFIG
+    echo 'LDLIBS += ' $LIBBPF_LDLIBS >> $CONFIG
+
+    if [ -z "$LIBBPF_DIR" ]; then
+        echo "CFLAGS += -DLIBBPF_DYNAMIC" >> $CONFIG
     fi
 
     echo "yes"
@@ -515,9 +454,6 @@ Usage: $0 [OPTIONS]
 	--include_dir <dir>		Path to iproute2 include dir
 	--libdir <dir>			Path to iproute2 lib dir
 	--libbpf_dir <dir>		Path to libbpf DESTDIR
-	--libbpf_force <on|off>		Enable/disable libbpf by force. Available options:
-					  on: require link against libbpf, quit config if no libbpf support
-					  off: disable libbpf probing
 	--prefix <dir>			Path prefix of the lib files to install
 	-h | --help			Show this usage info
 EOF
@@ -550,11 +486,6 @@ else
 				LIBBPF_DIR="$1" ;;
 			--libbpf_dir=*)
 				LIBBPF_DIR="${1#*=}" ;;
-			--libbpf_force)
-				shift
-				LIBBPF_FORCE="$1" ;;
-			--libbpf_force=*)
-				LIBBPF_FORCE="${1#*=}" ;;
 			--prefix)
 				shift
 				PREFIX="$1" ;;
@@ -581,11 +512,6 @@ esac
 if [ "${LIBBPF_DIR-unused}" != "unused" ]; then
 	[ -d "$LIBBPF_DIR" ] || usage 1
 fi
-if [ "${LIBBPF_FORCE-unused}" != "unused" ]; then
-	if [ "$LIBBPF_FORCE" != 'on' ] && [ "$LIBBPF_FORCE" != 'off' ]; then
-		usage 1
-	fi
-fi
 [ -z "$PREFIX" ] && usage 1
 [ -z "$LIBDIR" ] && usage 1
 
@@ -625,9 +551,6 @@ check_tirpc
 echo -n "libbpf support: "
 check_libbpf
 
-echo -n "ELF support: "
-check_elf
-
 echo -n "libmnl support: "
 check_mnl
 
diff --git a/etc/iproute2/bpf_pinning b/etc/iproute2/bpf_pinning
deleted file mode 100644
index 2b39c709..00000000
--- a/etc/iproute2/bpf_pinning
+++ /dev/null
@@ -1,6 +0,0 @@
-#
-# subpath mappings from mount point for pinning
-#
-#3	tracing
-#4	foo/bar
-#5	tc/cls1
diff --git a/examples/bpf/README b/examples/bpf/README
index 4c27bb4e..96d51701 100644
--- a/examples/bpf/README
+++ b/examples/bpf/README
@@ -1,18 +1,16 @@
 eBPF toy code examples (running in kernel) to familiarize yourself
 with syntax and features:
 
-- BTF defined map examples
  - bpf_graft.c		-> Demo on altering runtime behaviour
  - bpf_shared.c 	-> Ingress/egress map sharing example
  - bpf_map_in_map.c	-> Using map in map example
 
-- legacy struct bpf_elf_map defined map examples
- - legacy/bpf_shared.c		-> Ingress/egress map sharing example
- - legacy/bpf_tailcall.c	-> Using tail call chains
- - legacy/bpf_cyclic.c		-> Simple cycle as tail calls
- - legacy/bpf_graft.c		-> Demo on altering runtime behaviour
- - legacy/bpf_map_in_map.c	-> Using map in map example
+Maps are defined with BTF. Objects using the old struct bpf_elf_map
+definitions in a "maps" section are rejected by libbpf.
 
-Note: Users should use new BTF way to defined the maps, the examples
-in legacy folder which is using struct bpf_elf_map defined maps is not
-recommended.
+Build with BTF enabled, which the BTF defined maps require:
+
+ clang -target bpf -O2 -g -c bpf_shared.c -o bpf_shared.o
+
+Without -g libbpf refuses the object with "BTF is required, but is
+missing or corrupted".
diff --git a/examples/bpf/bpf_map_in_map.c b/examples/bpf/bpf_map_in_map.c
index 39c86268..7ada8712 100644
--- a/examples/bpf/bpf_map_in_map.c
+++ b/examples/bpf/bpf_map_in_map.c
@@ -23,7 +23,7 @@ struct {
 __section("egress")
 int emain(struct __sk_buff *skb)
 {
-	struct bpf_elf_map *map_inner;
+	void *map_inner;
 	int key = 0, *val;
 
 	map_inner = map_lookup_elem(&map_outer, &key);
@@ -39,7 +39,7 @@ int emain(struct __sk_buff *skb)
 __section("ingress")
 int imain(struct __sk_buff *skb)
 {
-	struct bpf_elf_map *map_inner;
+	void *map_inner;
 	int key = 0, *val;
 
 	map_inner = map_lookup_elem(&map_outer, &key);
diff --git a/examples/bpf/bpf_shared.c b/examples/bpf/bpf_shared.c
index 99a332f4..1d6d2911 100644
--- a/examples/bpf/bpf_shared.c
+++ b/examples/bpf/bpf_shared.c
@@ -2,20 +2,20 @@
 
 /* Minimal, stand-alone toy map pinning example:
  *
- * clang -target bpf -O2 [...] -o bpf_shared.o -c bpf_shared.c
+ * clang -target bpf -O2 -g [...] -o bpf_shared.o -c bpf_shared.c
  * tc filter add dev foo parent 1: bpf obj bpf_shared.o sec egress
  * tc filter add dev foo parent ffff: bpf obj bpf_shared.o sec ingress
  *
  * Both classifier will share the very same map instance in this example,
  * so map content can be accessed from ingress *and* egress side!
  *
- * This example has a pinning of PIN_OBJECT_NS, so it's private and
- * thus shared among various program sections within the object.
+ * Sections within one object file always refer to the same map, so the
+ * two programs above would share map_sh even without any pinning.
  *
- * A setting of PIN_GLOBAL_NS would place it into a global namespace,
- * so that it can be shared among different object files. A setting
- * of PIN_NONE (= 0) means no sharing, so each tc invocation a new map
- * instance is being created.
+ * LIBBPF_PIN_BY_NAME pins the map under /sys/fs/bpf/tc/globals/map_sh,
+ * which is what lets a *different* object file, or a later tc
+ * invocation, pick up the same instance. Without it (LIBBPF_PIN_NONE,
+ * the default) each tc invocation creates a new map.
  */
 
 struct {
diff --git a/examples/bpf/legacy/bpf_cyclic.c b/examples/bpf/legacy/bpf_cyclic.c
deleted file mode 100644
index 33590730..00000000
--- a/examples/bpf/legacy/bpf_cyclic.c
+++ /dev/null
@@ -1,35 +0,0 @@
-#include "../../../include/bpf_api.h"
-
-/* Cyclic dependency example to test the kernel's runtime upper
- * bound on loops. Also demonstrates on how to use direct-actions,
- * loaded as: tc filter add [...] bpf da obj [...]
- */
-#define JMP_MAP_ID	0xabccba
-
-struct bpf_elf_map __section_maps jmp_tc = {
-	.type		= BPF_MAP_TYPE_PROG_ARRAY,
-	.id		= JMP_MAP_ID,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.pinning	= PIN_OBJECT_NS,
-	.max_elem	= 1,
-};
-
-__section_tail(JMP_MAP_ID, 0)
-int cls_loop(struct __sk_buff *skb)
-{
-	printt("cb: %u\n", skb->cb[0]++);
-	tail_call(skb, &jmp_tc, 0);
-
-	skb->tc_classid = TC_H_MAKE(1, 42);
-	return TC_ACT_OK;
-}
-
-__section_cls_entry
-int cls_entry(struct __sk_buff *skb)
-{
-	tail_call(skb, &jmp_tc, 0);
-	return TC_ACT_SHOT;
-}
-
-BPF_LICENSE("GPL");
diff --git a/examples/bpf/legacy/bpf_graft.c b/examples/bpf/legacy/bpf_graft.c
deleted file mode 100644
index f4c920cc..00000000
--- a/examples/bpf/legacy/bpf_graft.c
+++ /dev/null
@@ -1,66 +0,0 @@
-#include "../../../include/bpf_api.h"
-
-/* This example demonstrates how classifier run-time behaviour
- * can be altered with tail calls. We start out with an empty
- * jmp_tc array, then add section aaa to the array slot 0, and
- * later on atomically replace it with section bbb. Note that
- * as shown in other examples, the tc loader can prepopulate
- * tail called sections, here we start out with an empty one
- * on purpose to show it can also be done this way.
- *
- * tc filter add dev foo parent ffff: bpf obj graft.o
- * tc exec bpf dbg
- *   [...]
- *   Socket Thread-20229 [001] ..s. 138993.003923: : fallthrough
- *   <idle>-0            [001] ..s. 138993.202265: : fallthrough
- *   Socket Thread-20229 [001] ..s. 138994.004149: : fallthrough
- *   [...]
- *
- * tc exec bpf graft m:globals/jmp_tc key 0 obj graft.o sec aaa
- * tc exec bpf dbg
- *   [...]
- *   Socket Thread-19818 [002] ..s. 139012.053587: : aaa
- *   <idle>-0            [002] ..s. 139012.172359: : aaa
- *   Socket Thread-19818 [001] ..s. 139012.173556: : aaa
- *   [...]
- *
- * tc exec bpf graft m:globals/jmp_tc key 0 obj graft.o sec bbb
- * tc exec bpf dbg
- *   [...]
- *   Socket Thread-19818 [002] ..s. 139022.102967: : bbb
- *   <idle>-0            [002] ..s. 139022.155640: : bbb
- *   Socket Thread-19818 [001] ..s. 139022.156730: : bbb
- *   [...]
- */
-
-struct bpf_elf_map __section_maps jmp_tc = {
-	.type		= BPF_MAP_TYPE_PROG_ARRAY,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.pinning	= PIN_GLOBAL_NS,
-	.max_elem	= 1,
-};
-
-__section("aaa")
-int cls_aaa(struct __sk_buff *skb)
-{
-	printt("aaa\n");
-	return TC_H_MAKE(1, 42);
-}
-
-__section("bbb")
-int cls_bbb(struct __sk_buff *skb)
-{
-	printt("bbb\n");
-	return TC_H_MAKE(1, 43);
-}
-
-__section_cls_entry
-int cls_entry(struct __sk_buff *skb)
-{
-	tail_call(skb, &jmp_tc, 0);
-	printt("fallthrough\n");
-	return BPF_H_DEFAULT;
-}
-
-BPF_LICENSE("GPL");
diff --git a/examples/bpf/legacy/bpf_map_in_map.c b/examples/bpf/legacy/bpf_map_in_map.c
deleted file mode 100644
index 575f8812..00000000
--- a/examples/bpf/legacy/bpf_map_in_map.c
+++ /dev/null
@@ -1,56 +0,0 @@
-#include "../../../include/bpf_api.h"
-
-#define MAP_INNER_ID	42
-
-struct bpf_elf_map __section_maps map_inner = {
-	.type		= BPF_MAP_TYPE_ARRAY,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.id		= MAP_INNER_ID,
-	.inner_idx	= 0,
-	.pinning	= PIN_GLOBAL_NS,
-	.max_elem	= 1,
-};
-
-struct bpf_elf_map __section_maps map_outer = {
-	.type		= BPF_MAP_TYPE_ARRAY_OF_MAPS,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.inner_id	= MAP_INNER_ID,
-	.pinning	= PIN_GLOBAL_NS,
-	.max_elem	= 1,
-};
-
-__section("egress")
-int emain(struct __sk_buff *skb)
-{
-	struct bpf_elf_map *map_inner;
-	int key = 0, *val;
-
-	map_inner = map_lookup_elem(&map_outer, &key);
-	if (map_inner) {
-		val = map_lookup_elem(map_inner, &key);
-		if (val)
-			lock_xadd(val, 1);
-	}
-
-	return BPF_H_DEFAULT;
-}
-
-__section("ingress")
-int imain(struct __sk_buff *skb)
-{
-	struct bpf_elf_map *map_inner;
-	int key = 0, *val;
-
-	map_inner = map_lookup_elem(&map_outer, &key);
-	if (map_inner) {
-		val = map_lookup_elem(map_inner, &key);
-		if (val)
-			printt("map val: %d\n", *val);
-	}
-
-	return BPF_H_DEFAULT;
-}
-
-BPF_LICENSE("GPL");
diff --git a/examples/bpf/legacy/bpf_shared.c b/examples/bpf/legacy/bpf_shared.c
deleted file mode 100644
index 05b2b9ef..00000000
--- a/examples/bpf/legacy/bpf_shared.c
+++ /dev/null
@@ -1,53 +0,0 @@
-#include "../../../include/bpf_api.h"
-
-/* Minimal, stand-alone toy map pinning example:
- *
- * clang -target bpf -O2 [...] -o bpf_shared.o -c bpf_shared.c
- * tc filter add dev foo parent 1: bpf obj bpf_shared.o sec egress
- * tc filter add dev foo parent ffff: bpf obj bpf_shared.o sec ingress
- *
- * Both classifier will share the very same map instance in this example,
- * so map content can be accessed from ingress *and* egress side!
- *
- * This example has a pinning of PIN_OBJECT_NS, so it's private and
- * thus shared among various program sections within the object.
- *
- * A setting of PIN_GLOBAL_NS would place it into a global namespace,
- * so that it can be shared among different object files. A setting
- * of PIN_NONE (= 0) means no sharing, so each tc invocation a new map
- * instance is being created.
- */
-
-struct bpf_elf_map __section_maps map_sh = {
-	.type		= BPF_MAP_TYPE_ARRAY,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.pinning	= PIN_OBJECT_NS, /* or PIN_GLOBAL_NS, or PIN_NONE */
-	.max_elem	= 1,
-};
-
-__section("egress")
-int emain(struct __sk_buff *skb)
-{
-	int key = 0, *val;
-
-	val = map_lookup_elem(&map_sh, &key);
-	if (val)
-		lock_xadd(val, 1);
-
-	return BPF_H_DEFAULT;
-}
-
-__section("ingress")
-int imain(struct __sk_buff *skb)
-{
-	int key = 0, *val;
-
-	val = map_lookup_elem(&map_sh, &key);
-	if (val)
-		printt("map val: %d\n", *val);
-
-	return BPF_H_DEFAULT;
-}
-
-BPF_LICENSE("GPL");
diff --git a/examples/bpf/legacy/bpf_tailcall.c b/examples/bpf/legacy/bpf_tailcall.c
deleted file mode 100644
index 8ebc554c..00000000
--- a/examples/bpf/legacy/bpf_tailcall.c
+++ /dev/null
@@ -1,117 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include "../../../include/bpf_api.h"
-
-#define ENTRY_INIT	3
-#define ENTRY_0		0
-#define ENTRY_1		1
-#define MAX_JMP_SIZE	2
-
-#define FOO		42
-#define BAR		43
-
-/* This example doesn't really do anything useful, but it's purpose is to
- * demonstrate eBPF tail calls on a very simple example.
- *
- * cls_entry() is our classifier entry point, from there we jump based on
- * skb->hash into cls_case1() or cls_case2(). They are both part of the
- * program array jmp_tc. Indicated via __section_tail(), the tc loader
- * populates the program arrays with the loaded file descriptors already.
- *
- * To demonstrate nested jumps, cls_case2() jumps within the same jmp_tc
- * array to cls_case1(). And whenever we arrive at cls_case1(), we jump
- * into cls_exit(), part of the jump array jmp_ex.
- *
- * Also, to show it's possible, all programs share map_sh and dump the value
- * that the entry point incremented. The sections that are loaded into a
- * program array can be atomically replaced during run-time, e.g. to change
- * classifier behaviour.
- */
-
-struct bpf_elf_map __section_maps jmp_tc = {
-	.type		= BPF_MAP_TYPE_PROG_ARRAY,
-	.id		= FOO,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.pinning	= PIN_OBJECT_NS,
-	.max_elem	= MAX_JMP_SIZE,
-};
-
-struct bpf_elf_map __section_maps jmp_ex = {
-	.type		= BPF_MAP_TYPE_PROG_ARRAY,
-	.id		= BAR,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.pinning	= PIN_OBJECT_NS,
-	.max_elem	= 1,
-};
-
-struct bpf_elf_map __section_maps map_sh = {
-	.type		= BPF_MAP_TYPE_ARRAY,
-	.size_key	= sizeof(uint32_t),
-	.size_value	= sizeof(uint32_t),
-	.pinning	= PIN_OBJECT_NS,
-	.max_elem	= 1,
-};
-
-__section_tail(FOO, ENTRY_0)
-int cls_case1(struct __sk_buff *skb)
-{
-	int key = 0, *val;
-
-	val = map_lookup_elem(&map_sh, &key);
-	if (val)
-		printt("case1: map-val: %d from:%u\n", *val, skb->cb[0]);
-
-	skb->cb[0] = ENTRY_0;
-	tail_call(skb, &jmp_ex, ENTRY_0);
-
-	return BPF_H_DEFAULT;
-}
-
-__section_tail(FOO, ENTRY_1)
-int cls_case2(struct __sk_buff *skb)
-{
-	int key = 0, *val;
-
-	val = map_lookup_elem(&map_sh, &key);
-	if (val)
-		printt("case2: map-val: %d from:%u\n", *val, skb->cb[0]);
-
-	skb->cb[0] = ENTRY_1;
-	tail_call(skb, &jmp_tc, ENTRY_0);
-
-	return BPF_H_DEFAULT;
-}
-
-__section_tail(BAR, ENTRY_0)
-int cls_exit(struct __sk_buff *skb)
-{
-	int key = 0, *val;
-
-	val = map_lookup_elem(&map_sh, &key);
-	if (val)
-		printt("exit: map-val: %d from:%u\n", *val, skb->cb[0]);
-
-	/* Termination point. */
-	return BPF_H_DEFAULT;
-}
-
-__section_cls_entry
-int cls_entry(struct __sk_buff *skb)
-{
-	int key = 0, *val;
-
-	/* For transferring state, we can use skb->cb[0] ... skb->cb[4]. */
-	val = map_lookup_elem(&map_sh, &key);
-	if (val) {
-		lock_xadd(val, 1);
-
-		skb->cb[0] = ENTRY_INIT;
-		tail_call(skb, &jmp_tc, skb->hash & (MAX_JMP_SIZE - 1));
-	}
-
-	printt("fallthrough\n");
-	return BPF_H_DEFAULT;
-}
-
-BPF_LICENSE("GPL");
diff --git a/include/bpf_api.h b/include/bpf_api.h
index 287f96b6..d51b08b2 100644
--- a/include/bpf_api.h
+++ b/include/bpf_api.h
@@ -5,7 +5,7 @@
 /* Note:
  *
  * This file can be included into eBPF kernel programs. It contains
- * a couple of useful helper functions, map/section ABI (bpf_elf.h),
+ * a couple of useful helper functions, section names (bpf_elf.h),
  * misc macros and some eBPF specific LLVM built-ins.
  */
 
@@ -111,11 +111,6 @@ enum libbpf_pin_type {
 	__section(ELF_SECTION_LICENSE)
 #endif
 
-#ifndef __section_maps
-# define __section_maps							\
-	__section(ELF_SECTION_MAPS)
-#endif
-
 /** Declaration helper macros. */
 
 #ifndef BPF_LICENSE
diff --git a/include/bpf_elf.h b/include/bpf_elf.h
index ea8a11c9..82331bde 100644
--- a/include/bpf_elf.h
+++ b/include/bpf_elf.h
@@ -6,48 +6,27 @@
 
 /* Note:
  *
- * Below ELF section names and bpf_elf_map structure definition
- * are not (!) kernel ABI. It's rather a "contract" between the
- * application and the BPF loader in tc. For compatibility, the
- * section names should stay as-is. Introduction of aliases, if
- * needed, are a possibility, though.
+ * The ELF section names below are the ones the tc front-end looks for
+ * when picking a program out of an object file. For compatibility, they
+ * should stay as-is.
  */
 
 /* ELF section names, etc */
 #define ELF_SECTION_LICENSE	"license"
-#define ELF_SECTION_MAPS	"maps"
 #define ELF_SECTION_PROG	"prog"
 #define ELF_SECTION_CLASSIFIER	"classifier"
 #define ELF_SECTION_ACTION	"action"
 
-#define ELF_MAX_MAPS		64
-#define ELF_MAX_LICENSE_LEN	128
-
-/* Object pinning settings */
-#define PIN_NONE		0
-#define PIN_OBJECT_NS		1
-#define PIN_GLOBAL_NS		2
-
-/* ELF map definition */
+/* Map description used by the pinned map self-check in bpf_graft_map().
+ * This is not a kernel ABI and no longer describes any on-disk format;
+ * it only holds the values read back from /proc/self/fdinfo.
+ */
 struct bpf_elf_map {
 	__u32 type;
 	__u32 size_key;
 	__u32 size_value;
 	__u32 max_elem;
 	__u32 flags;
-	__u32 id;
-	__u32 pinning;
-	__u32 inner_id;
-	__u32 inner_idx;
 };
 
-#define BPF_ANNOTATE_KV_PAIR(name, type_key, type_val)		\
-	struct ____btf_map_##name {				\
-		type_key key;					\
-		type_val value;					\
-	};							\
-	struct ____btf_map_##name				\
-	    __attribute__ ((section(".maps." #name), used))	\
-	    ____btf_map_##name = { }
-
 #endif /* __BPF_ELF__ */
diff --git a/include/bpf_util.h b/include/bpf_util.h
index 78c38e80..ea46f28f 100644
--- a/include/bpf_util.h
+++ b/include/bpf_util.h
@@ -271,34 +271,15 @@ int bpf_program_load(enum bpf_prog_type type, const struct bpf_insn *insns,
 		     size_t size_insns, const char *license, char *log,
 		     size_t size_log, bool verbose);
 
-int bpf_prog_attach_fd(int prog_fd, int target_fd, enum bpf_attach_type type);
-int bpf_prog_detach_fd(int target_fd, enum bpf_attach_type type);
 int bpf_program_attach(int prog_fd, int target_fd, enum bpf_attach_type type);
 
 int bpf_dump_prog_info(FILE *f, uint32_t id);
 
 int bpf(int cmd, union bpf_attr *attr, unsigned int size);
 
-#ifdef HAVE_ELF
-#ifdef HAVE_LIBBPF
-int iproute2_bpf_elf_ctx_init(struct bpf_cfg_in *cfg);
-int iproute2_bpf_fetch_ancillary(void);
-int iproute2_get_root_path(char *root_path, size_t len);
-bool iproute2_is_pin_map(const char *libbpf_map_name, char *pathname);
-bool iproute2_is_map_in_map(const char *libbpf_map_name, struct bpf_elf_map *imap,
-			    struct bpf_elf_map *omap, char *omap_name);
-int iproute2_find_map_name_by_id(unsigned int map_id, char *name);
+int iproute2_get_root_path(enum bpf_prog_type type, char *root_path,
+			   size_t len);
 int iproute2_load_libbpf(struct bpf_cfg_in *cfg);
-#endif /* HAVE_LIBBPF */
-#else
-#ifdef HAVE_LIBBPF
-static inline int iproute2_load_libbpf(struct bpf_cfg_in *cfg)
-{
-	fprintf(stderr, "No ELF library support compiled in.\n");
-	return -1;
-}
-#endif /* HAVE_LIBBPF */
-#endif /* HAVE_ELF */
 
 const char *get_libbpf_version(void);
 
diff --git a/include/sha1.h b/include/sha1.h
deleted file mode 100644
index 4a2ed513..00000000
--- a/include/sha1.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * SHA-1 message digest algorithm
- *
- * Copyright 2025 Google LLC
- */
-#ifndef __SHA1_H__
-#define __SHA1_H__
-
-#include <linux/types.h>
-#include <stddef.h>
-
-#define SHA1_DIGEST_SIZE 20
-#define SHA1_BLOCK_SIZE 64
-
-void sha1(const __u8 *data, size_t len, __u8 out[SHA1_DIGEST_SIZE]);
-
-#endif /* __SHA1_H__ */
diff --git a/ip/iplink.c b/ip/iplink.c
index c6aee8b6..6b325e20 100644
--- a/ip/iplink.c
+++ b/ip/iplink.c
@@ -94,11 +94,7 @@ void iplink_usage(void)
 		"			 [ node_guid EUI64 ]\n"
 		"			 [ port_guid EUI64 ] ]\n"
 		"		[ { xdp | xdpgeneric | xdpdrv | xdpoffload } { off |\n"
-#ifdef HAVE_LIBBPF
 		"			  object FILE [ { section | program } NAME ] [ verbose ] |\n"
-#else
-		"			  object FILE [ section NAME ] [ verbose ] |\n"
-#endif
 		"			  pinned FILE } ]\n"
 		"		[ master DEVICE ][ vrf NAME ]\n"
 		"		[ nomaster ]\n"
diff --git a/lib/Makefile b/lib/Makefile
index 7035f40f..c1dfc759 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -5,14 +5,8 @@ CFLAGS += -fPIC
 
 UTILOBJ = utils.o utils_math.o rt_names.o ll_map.o ll_types.o ll_proto.o ll_addr.o \
 	inet_proto.o namespace.o json_writer.o json_print.o json_print_math.o \
-	names.o color.o bpf_legacy.o bpf_glue.o exec.o fs.o cg_map.o \
-	ppp_proto.o bridge.o sha1.o escape.o
-
-ifeq ($(HAVE_ELF),y)
-ifeq ($(HAVE_LIBBPF),y)
-UTILOBJ += bpf_libbpf.o
-endif
-endif
+	names.o color.o bpf_util.o bpf_glue.o bpf_libbpf.o exec.o fs.o \
+	cg_map.o ppp_proto.o bridge.o escape.o
 
 ifneq ($(HAVE_SELINUX),y)
 UTILOBJ += selinux.o
diff --git a/lib/bpf_glue.c b/lib/bpf_glue.c
index 88a24751..6b70f799 100644
--- a/lib/bpf_glue.c
+++ b/lib/bpf_glue.c
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * bpf_glue.c:	BPF code to call both legacy and libbpf code
+ * bpf_glue.c:	BPF syscall and libbpf wrappers
  * Authors:	Hangbin Liu <haliu@redhat.com>
  *
  */
@@ -10,9 +10,7 @@
 #include <errno.h>
 
 #include "bpf_util.h"
-#ifdef HAVE_LIBBPF
 #include <bpf/bpf.h>
-#endif
 
 int bpf(int cmd, union bpf_attr *attr, unsigned int size)
 {
@@ -27,14 +25,9 @@ int bpf(int cmd, union bpf_attr *attr, unsigned int size)
 
 int bpf_program_attach(int prog_fd, int target_fd, enum bpf_attach_type type)
 {
-#ifdef HAVE_LIBBPF
 	return bpf_prog_attach(prog_fd, target_fd, type, 0);
-#else
-	return bpf_prog_attach_fd(prog_fd, target_fd, type);
-#endif
 }
 
-#ifdef HAVE_LIBBPF
 static const char *_libbpf_compile_version = LIBBPF_VERSION;
 static char _libbpf_version[10] = {};
 
@@ -83,9 +76,3 @@ out:
 	_libbpf_version[sizeof(_libbpf_version)-1] = '\0';
 	return _libbpf_version;
 }
-#else
-const char *get_libbpf_version(void)
-{
-	return NULL;
-}
-#endif /* HAVE_LIBBPF */
diff --git a/lib/bpf_legacy.c b/lib/bpf_legacy.c
deleted file mode 100644
index f9844fd4..00000000
--- a/lib/bpf_legacy.c
+++ /dev/null
@@ -1,3093 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * bpf.c	BPF common code
- *
- * Authors:	Daniel Borkmann <daniel@iogearbox.net>
- *		Jiri Pirko <jiri@resnulli.us>
- *		Alexei Starovoitov <ast@kernel.org>
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-#include <stdbool.h>
-#include <stdint.h>
-#include <errno.h>
-#include <fcntl.h>
-#include <stdarg.h>
-#include <limits.h>
-#include <assert.h>
-#include <libgen.h>
-
-#ifdef HAVE_ELF
-#include <libelf.h>
-#include <gelf.h>
-#endif
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <sys/un.h>
-#include <sys/vfs.h>
-#include <sys/mman.h>
-#include <sys/mount.h>
-#include <sys/resource.h>
-#include <mntent.h>
-
-#include <arpa/inet.h>
-
-#include "utils.h"
-#include "json_print.h"
-#include "sha1.h"
-
-#include "bpf_util.h"
-#include "bpf_elf.h"
-
-struct bpf_prog_meta {
-	const char *type;
-	const char *subdir;
-	const char *section;
-};
-
-static const enum bpf_prog_type __bpf_types[] = {
-	BPF_PROG_TYPE_SCHED_CLS,
-	BPF_PROG_TYPE_SCHED_ACT,
-	BPF_PROG_TYPE_XDP,
-	BPF_PROG_TYPE_LWT_IN,
-	BPF_PROG_TYPE_LWT_OUT,
-	BPF_PROG_TYPE_LWT_XMIT,
-};
-
-static const struct bpf_prog_meta __bpf_prog_meta[] = {
-	[BPF_PROG_TYPE_SCHED_CLS] = {
-		.type		= "cls",
-		.subdir		= "tc",
-		.section	= ELF_SECTION_CLASSIFIER,
-	},
-	[BPF_PROG_TYPE_SCHED_ACT] = {
-		.type		= "act",
-		.subdir		= "tc",
-		.section	= ELF_SECTION_ACTION,
-	},
-	[BPF_PROG_TYPE_XDP] = {
-		.type		= "xdp",
-		.subdir		= "xdp",
-		.section	= ELF_SECTION_PROG,
-	},
-	[BPF_PROG_TYPE_LWT_IN] = {
-		.type		= "lwt_in",
-		.subdir		= "ip",
-		.section	= ELF_SECTION_PROG,
-	},
-	[BPF_PROG_TYPE_LWT_OUT] = {
-		.type		= "lwt_out",
-		.subdir		= "ip",
-		.section	= ELF_SECTION_PROG,
-	},
-	[BPF_PROG_TYPE_LWT_XMIT] = {
-		.type		= "lwt_xmit",
-		.subdir		= "ip",
-		.section	= ELF_SECTION_PROG,
-	},
-	[BPF_PROG_TYPE_LWT_SEG6LOCAL] = {
-		.type		= "lwt_seg6local",
-		.subdir		= "ip",
-		.section	= ELF_SECTION_PROG,
-	},
-};
-
-static const char *bpf_prog_to_subdir(enum bpf_prog_type type)
-{
-	assert(type < ARRAY_SIZE(__bpf_prog_meta) &&
-	       __bpf_prog_meta[type].subdir);
-	return __bpf_prog_meta[type].subdir;
-}
-
-const char *bpf_prog_to_default_section(enum bpf_prog_type type)
-{
-	assert(type < ARRAY_SIZE(__bpf_prog_meta) &&
-	       __bpf_prog_meta[type].section);
-	return __bpf_prog_meta[type].section;
-}
-
-#ifdef HAVE_ELF
-static int bpf_obj_open(const char *path, enum bpf_prog_type type,
-			const char *sec, __u32 ifindex, bool verbose);
-#else
-static int bpf_obj_open(const char *path, enum bpf_prog_type type,
-			const char *sec, __u32 ifindex, bool verbose)
-{
-	fprintf(stderr, "No ELF library support compiled in.\n");
-	errno = ENOSYS;
-	return -1;
-}
-#endif
-
-static inline __u64 bpf_ptr_to_u64(const void *ptr)
-{
-	return (__u64)(unsigned long)ptr;
-}
-
-static int bpf_map_update(int fd, const void *key, const void *value,
-			  uint64_t flags)
-{
-	union bpf_attr attr = {};
-
-	attr.map_fd = fd;
-	attr.key = bpf_ptr_to_u64(key);
-	attr.value = bpf_ptr_to_u64(value);
-	attr.flags = flags;
-
-	return bpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof(attr));
-}
-
-static int bpf_prog_fd_by_id(uint32_t id)
-{
-	union bpf_attr attr = {};
-
-	attr.prog_id = id;
-
-	return bpf(BPF_PROG_GET_FD_BY_ID, &attr, sizeof(attr));
-}
-
-static int bpf_prog_info_by_fd(int fd, struct bpf_prog_info *info,
-			       uint32_t *info_len)
-{
-	union bpf_attr attr = {};
-	int ret;
-
-	attr.info.bpf_fd = fd;
-	attr.info.info = bpf_ptr_to_u64(info);
-	attr.info.info_len = *info_len;
-
-	*info_len = 0;
-	ret = bpf(BPF_OBJ_GET_INFO_BY_FD, &attr, sizeof(attr));
-	if (!ret)
-		*info_len = attr.info.info_len;
-
-	return ret;
-}
-
-int bpf_dump_prog_info(FILE *f, uint32_t id)
-{
-	struct bpf_prog_info info = {};
-	uint32_t len = sizeof(info);
-	int fd, ret, dump_ok = 0;
-
-	open_json_object("prog");
-	print_uint(PRINT_ANY, "id", "id %u ", id);
-
-	fd = bpf_prog_fd_by_id(id);
-	if (fd < 0)
-		goto out;
-
-	ret = bpf_prog_info_by_fd(fd, &info, &len);
-	if (!ret && len) {
-		int jited = !!info.jited_prog_len;
-
-		print_string(PRINT_ANY, "name", "name %s ", info.name);
-		print_hexstring("tag", "tag %s ",
-				info.tag, sizeof(info.tag));
-		print_uint(PRINT_JSON, "jited", NULL, jited);
-		if (jited && !is_json_context())
-			fprintf(f, "jited ");
-
-		if (show_details) {
-			if (info.load_time) {
-				/* ns since boottime */
-				print_lluint(PRINT_ANY, "load_time",
-					     "load_time %llu ", info.load_time);
-
-				print_luint(PRINT_ANY, "created_by_uid",
-					    "created_by_uid %lu ",
-					    info.created_by_uid);
-			}
-
-			if (info.btf_id)
-				print_luint(PRINT_ANY, "btf_id", "btf_id %lu ",
-					    info.btf_id);
-		}
-
-		dump_ok = 1;
-	}
-
-	close(fd);
-out:
-	close_json_object();
-	return dump_ok;
-}
-
-static int bpf_parse_string(char *arg, bool from_file, __u16 *bpf_len,
-			    char **bpf_string, bool *need_release,
-			    const char separator)
-{
-	char sp;
-
-	if (from_file) {
-		size_t tmp_len, op_len = sizeof("65535 255 255 4294967295,");
-		char *tmp_string, *pos, c_prev = ' ';
-		FILE *fp;
-		int c;
-
-		tmp_len = sizeof("4096,") + BPF_MAXINSNS * op_len;
-		tmp_string = pos = calloc(1, tmp_len);
-		if (tmp_string == NULL)
-			return -ENOMEM;
-
-		fp = fopen(arg, "r");
-		if (fp == NULL) {
-			perror("Cannot fopen");
-			free(tmp_string);
-			return -ENOENT;
-		}
-
-		while ((c = fgetc(fp)) != EOF) {
-			switch (c) {
-			case '\n':
-				if (c_prev != ',')
-					*(pos++) = ',';
-				c_prev = ',';
-				break;
-			case ' ':
-			case '\t':
-				if (c_prev != ' ')
-					*(pos++) = c;
-				c_prev = ' ';
-				break;
-			default:
-				*(pos++) = c;
-				c_prev = c;
-			}
-			if (pos - tmp_string == tmp_len)
-				break;
-		}
-
-		if (!feof(fp)) {
-			free(tmp_string);
-			fclose(fp);
-			return -E2BIG;
-		}
-
-		fclose(fp);
-		*pos = 0;
-
-		*need_release = true;
-		*bpf_string = tmp_string;
-	} else {
-		*need_release = false;
-		*bpf_string = arg;
-	}
-
-	if (sscanf(*bpf_string, "%hu%c", bpf_len, &sp) != 2 ||
-	    sp != separator) {
-		if (*need_release)
-			free(*bpf_string);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int bpf_ops_parse(int argc, char **argv, struct sock_filter *bpf_ops,
-			 bool from_file)
-{
-	char *bpf_string, *token, separator = ',';
-	int ret = 0, i = 0;
-	bool need_release;
-	__u16 bpf_len = 0;
-
-	if (argc < 1)
-		return -EINVAL;
-	if (bpf_parse_string(argv[0], from_file, &bpf_len, &bpf_string,
-			     &need_release, separator))
-		return -EINVAL;
-	if (bpf_len == 0 || bpf_len > BPF_MAXINSNS) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	token = bpf_string;
-	while ((token = strchr(token, separator)) && (++token)[0]) {
-		if (i >= bpf_len) {
-			fprintf(stderr, "Real program length exceeds encoded length parameter!\n");
-			ret = -EINVAL;
-			goto out;
-		}
-
-		if (sscanf(token, "%hu %hhu %hhu %u,",
-			   &bpf_ops[i].code, &bpf_ops[i].jt,
-			   &bpf_ops[i].jf, &bpf_ops[i].k) != 4) {
-			fprintf(stderr, "Error at instruction %d!\n", i);
-			ret = -EINVAL;
-			goto out;
-		}
-
-		i++;
-	}
-
-	if (i != bpf_len) {
-		fprintf(stderr, "Parsed program length is less than encoded length parameter!\n");
-		ret = -EINVAL;
-		goto out;
-	}
-	ret = bpf_len;
-out:
-	if (need_release)
-		free(bpf_string);
-
-	return ret;
-}
-
-void bpf_print_ops(struct rtattr *bpf_ops, __u16 len)
-{
-	struct sock_filter *ops = RTA_DATA(bpf_ops);
-	int i;
-
-	if (len == 0)
-		return;
-
-	open_json_object("bytecode");
-	print_uint(PRINT_ANY, "length", "bytecode \'%u,", len);
-	open_json_array(PRINT_JSON, "insns");
-
-	for (i = 0; i < len; i++) {
-		open_json_object(NULL);
-		print_hu(PRINT_ANY, "code", "%hu ", ops[i].code);
-		print_hhu(PRINT_ANY, "jt", "%hhu ", ops[i].jt);
-		print_hhu(PRINT_ANY, "jf", "%hhu ", ops[i].jf);
-		if (i == len - 1)
-			print_uint(PRINT_ANY, "k", "%u\'", ops[i].k);
-		else
-			print_uint(PRINT_ANY, "k", "%u,", ops[i].k);
-		close_json_object();
-	}
-
-	close_json_array(PRINT_JSON, NULL);
-	close_json_object();
-}
-
-static void bpf_map_pin_report(const struct bpf_elf_map *pin,
-			       const struct bpf_elf_map *obj)
-{
-	fprintf(stderr, "Map specification differs from pinned file!\n");
-
-	if (obj->type != pin->type)
-		fprintf(stderr, " - Type:         %u (obj) != %u (pin)\n",
-			obj->type, pin->type);
-	if (obj->size_key != pin->size_key)
-		fprintf(stderr, " - Size key:     %u (obj) != %u (pin)\n",
-			obj->size_key, pin->size_key);
-	if (obj->size_value != pin->size_value)
-		fprintf(stderr, " - Size value:   %u (obj) != %u (pin)\n",
-			obj->size_value, pin->size_value);
-	if (obj->max_elem != pin->max_elem)
-		fprintf(stderr, " - Max elems:    %u (obj) != %u (pin)\n",
-			obj->max_elem, pin->max_elem);
-	if (obj->flags != pin->flags)
-		fprintf(stderr, " - Flags:        %#x (obj) != %#x (pin)\n",
-			obj->flags, pin->flags);
-
-	fprintf(stderr, "\n");
-}
-
-struct bpf_prog_data {
-	unsigned int type;
-	unsigned int jited;
-};
-
-struct bpf_map_ext {
-	struct bpf_prog_data owner;
-	unsigned int btf_id_key;
-	unsigned int btf_id_val;
-};
-
-static int bpf_derive_elf_map_from_fdinfo(int fd, struct bpf_elf_map *map,
-					  struct bpf_map_ext *ext)
-{
-	unsigned int val, owner_type = 0, owner_jited = 0;
-	char file[PATH_MAX], buff[4096];
-	FILE *fp;
-
-	snprintf(file, sizeof(file), "/proc/%d/fdinfo/%d", getpid(), fd);
-	memset(map, 0, sizeof(*map));
-
-	fp = fopen(file, "r");
-	if (!fp) {
-		fprintf(stderr, "No procfs support?!\n");
-		return -EIO;
-	}
-
-	while (fgets(buff, sizeof(buff), fp)) {
-		if (sscanf(buff, "map_type:\t%u", &val) == 1)
-			map->type = val;
-		else if (sscanf(buff, "key_size:\t%u", &val) == 1)
-			map->size_key = val;
-		else if (sscanf(buff, "value_size:\t%u", &val) == 1)
-			map->size_value = val;
-		else if (sscanf(buff, "max_entries:\t%u", &val) == 1)
-			map->max_elem = val;
-		else if (sscanf(buff, "map_flags:\t%i", &val) == 1)
-			map->flags = val;
-		else if (sscanf(buff, "owner_prog_type:\t%i", &val) == 1)
-			owner_type = val;
-		else if (sscanf(buff, "owner_jited:\t%i", &val) == 1)
-			owner_jited = val;
-	}
-
-	fclose(fp);
-	if (ext) {
-		memset(ext, 0, sizeof(*ext));
-		ext->owner.type  = owner_type;
-		ext->owner.jited = owner_jited;
-	}
-
-	return 0;
-}
-
-static int bpf_map_selfcheck_pinned(int fd, const struct bpf_elf_map *map,
-				    struct bpf_map_ext *ext, int length,
-				    enum bpf_prog_type type)
-{
-	struct bpf_elf_map tmp, zero = {};
-	int ret;
-
-	ret = bpf_derive_elf_map_from_fdinfo(fd, &tmp, ext);
-	if (ret < 0)
-		return ret;
-
-	/* The decision to reject this is on kernel side eventually, but
-	 * at least give the user a chance to know what's wrong.
-	 */
-	if (ext->owner.type && ext->owner.type != type)
-		fprintf(stderr, "Program array map owner types differ: %u (obj) != %u (pin)\n",
-			type, ext->owner.type);
-
-	if (!memcmp(&tmp, map, length)) {
-		return 0;
-	} else {
-		/* If kernel doesn't have eBPF-related fdinfo, we cannot do much,
-		 * so just accept it. We know we do have an eBPF fd and in this
-		 * case, everything is 0. It is guaranteed that no such map exists
-		 * since map type of 0 is unloadable BPF_MAP_TYPE_UNSPEC.
-		 */
-		if (!memcmp(&tmp, &zero, length))
-			return 0;
-
-		bpf_map_pin_report(&tmp, map);
-		return -EINVAL;
-	}
-}
-
-static int bpf_mnt_fs(const char *target)
-{
-	bool bind_done = false;
-
-	while (mount("", target, "none", MS_PRIVATE | MS_REC, NULL)) {
-		if (errno != EINVAL || bind_done) {
-			fprintf(stderr, "mount --make-private %s failed: %s\n",
-				target,	strerror(errno));
-			return -1;
-		}
-
-		if (mount(target, target, "none", MS_BIND, NULL)) {
-			fprintf(stderr, "mount --bind %s %s failed: %s\n",
-				target,	target, strerror(errno));
-			return -1;
-		}
-
-		bind_done = true;
-	}
-
-	if (mount("bpf", target, "bpf", 0, "mode=0700")) {
-		fprintf(stderr, "mount -t bpf bpf %s failed: %s\n",
-			target,	strerror(errno));
-		return -1;
-	}
-
-	return 0;
-}
-
-static int bpf_mnt_check_target(const char *target)
-{
-	int ret;
-
-	ret = mkdir(target, S_IRWXU);
-	if (ret) {
-		if (errno == EEXIST)
-			return 0;
-		fprintf(stderr, "mkdir %s failed: %s\n", target,
-			strerror(errno));
-	}
-
-	return ret;
-}
-
-static int bpf_valid_mntpt(const char *mnt, unsigned long magic)
-{
-	struct statfs st_fs;
-
-	if (statfs(mnt, &st_fs) < 0)
-		return -ENOENT;
-	if ((unsigned long)st_fs.f_type != magic)
-		return -ENOENT;
-
-	return 0;
-}
-
-static const char *bpf_find_mntpt_single(unsigned long magic, char *mnt,
-					 int len, const char *mntpt)
-{
-	int ret;
-
-	ret = bpf_valid_mntpt(mntpt, magic);
-	if (ret)
-		return NULL;
-
-	if (strlcpy(mnt, mntpt, len) >= (size_t)len)
-		return NULL;
-
-	return mnt;
-}
-
-static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
-				  char *mnt, int len,
-				  const char * const *known_mnts)
-{
-	const char * const *ptr;
-	const char *found = NULL;
-	struct mntent *ent;
-	FILE *fp;
-
-	if (known_mnts) {
-		ptr = known_mnts;
-		while (*ptr) {
-			if (bpf_find_mntpt_single(magic, mnt, len, *ptr))
-				return mnt;
-			ptr++;
-		}
-	}
-
-	fp = setmntent("/proc/mounts", "r");
-	if (fp == NULL)
-		return NULL;
-
-	while ((ent = getmntent(fp)) != NULL) {
-		if (strcmp(ent->mnt_type, fstype) != 0)
-			continue;
-
-		found = bpf_find_mntpt_single(magic, mnt, len, ent->mnt_dir);
-		if (found)
-			break;
-	}
-
-	endmntent(fp);
-	return found;
-}
-
-int bpf_trace_pipe(void)
-{
-	char tracefs_mnt[PATH_MAX] = TRACE_DIR_MNT;
-	static const char * const tracefs_known_mnts[] = {
-		TRACE_DIR_MNT,
-		"/sys/kernel/debug/tracing",
-		"/tracing",
-		"/trace",
-		0,
-	};
-	int fd_in, fd_out = STDERR_FILENO;
-	char tpipe[PATH_MAX];
-	const char *mnt;
-
-	mnt = bpf_find_mntpt("tracefs", TRACEFS_MAGIC, tracefs_mnt,
-			     sizeof(tracefs_mnt), tracefs_known_mnts);
-	if (!mnt) {
-		fprintf(stderr, "tracefs not mounted?\n");
-		return -1;
-	}
-
-	snprintf(tpipe, sizeof(tpipe), "%s/trace_pipe", mnt);
-
-	fd_in = open(tpipe, O_RDONLY);
-	if (fd_in < 0)
-		return -1;
-
-	fprintf(stderr, "Running! Hang up with ^C!\n\n");
-	while (1) {
-		static char buff[4096];
-		ssize_t ret;
-
-		ret = read(fd_in, buff, sizeof(buff));
-		if (ret > 0 && write(fd_out, buff, ret) == ret)
-			continue;
-		break;
-	}
-
-	close(fd_in);
-	return -1;
-}
-
-static int bpf_gen_global(const char *bpf_sub_dir)
-{
-	char bpf_glo_dir[PATH_MAX];
-	int ret;
-
-	snprintf(bpf_glo_dir, sizeof(bpf_glo_dir), "%s/%s/",
-		 bpf_sub_dir, BPF_DIR_GLOBALS);
-
-	ret = mkdir(bpf_glo_dir, S_IRWXU);
-	if (ret && errno != EEXIST) {
-		fprintf(stderr, "mkdir %s failed: %s\n", bpf_glo_dir,
-			strerror(errno));
-		return ret;
-	}
-
-	return 0;
-}
-
-static int bpf_gen_master(const char *base, const char *name)
-{
-	char bpf_sub_dir[PATH_MAX + NAME_MAX + 1];
-	int ret;
-
-	snprintf(bpf_sub_dir, sizeof(bpf_sub_dir), "%s%s/", base, name);
-
-	ret = mkdir(bpf_sub_dir, S_IRWXU);
-	if (ret && errno != EEXIST) {
-		fprintf(stderr, "mkdir %s failed: %s\n", bpf_sub_dir,
-			strerror(errno));
-		return ret;
-	}
-
-	return bpf_gen_global(bpf_sub_dir);
-}
-
-static int bpf_slave_via_bind_mnt(const char *full_name,
-				  const char *full_link)
-{
-	int ret;
-
-	ret = mkdir(full_name, S_IRWXU);
-	if (ret) {
-		assert(errno != EEXIST);
-		fprintf(stderr, "mkdir %s failed: %s\n", full_name,
-			strerror(errno));
-		return ret;
-	}
-
-	ret = mount(full_link, full_name, "none", MS_BIND, NULL);
-	if (ret) {
-		rmdir(full_name);
-		fprintf(stderr, "mount --bind %s %s failed: %s\n",
-			full_link, full_name, strerror(errno));
-	}
-
-	return ret;
-}
-
-static int bpf_gen_slave(const char *base, const char *name,
-			 const char *link)
-{
-	char bpf_lnk_dir[PATH_MAX + NAME_MAX + 1];
-	char bpf_sub_dir[PATH_MAX + NAME_MAX];
-	struct stat sb = {};
-	int ret;
-
-	snprintf(bpf_lnk_dir, sizeof(bpf_lnk_dir), "%s%s/", base, link);
-	snprintf(bpf_sub_dir, sizeof(bpf_sub_dir), "%s%s",  base, name);
-
-	ret = symlink(bpf_lnk_dir, bpf_sub_dir);
-	if (ret) {
-		if (errno != EEXIST) {
-			if (errno != EPERM) {
-				fprintf(stderr, "symlink %s failed: %s\n",
-					bpf_sub_dir, strerror(errno));
-				return ret;
-			}
-
-			return bpf_slave_via_bind_mnt(bpf_sub_dir,
-						      bpf_lnk_dir);
-		}
-
-		ret = lstat(bpf_sub_dir, &sb);
-		if (ret) {
-			fprintf(stderr, "lstat %s failed: %s\n",
-				bpf_sub_dir, strerror(errno));
-			return ret;
-		}
-
-		if ((sb.st_mode & S_IFMT) != S_IFLNK)
-			return bpf_gen_global(bpf_sub_dir);
-	}
-
-	return 0;
-}
-
-static int bpf_gen_hierarchy(const char *base)
-{
-	int ret, i;
-
-	ret = bpf_gen_master(base, bpf_prog_to_subdir(__bpf_types[0]));
-	for (i = 1; i < ARRAY_SIZE(__bpf_types) && !ret; i++)
-		ret = bpf_gen_slave(base,
-				    bpf_prog_to_subdir(__bpf_types[i]),
-				    bpf_prog_to_subdir(__bpf_types[0]));
-	return ret;
-}
-
-static const char *bpf_get_work_dir(enum bpf_prog_type type)
-{
-	static char bpf_tmp[PATH_MAX] = BPF_DIR_MNT;
-	static char bpf_wrk_dir[PATH_MAX];
-	static const char *mnt;
-	static bool bpf_mnt_cached;
-	const char *mnt_env = getenv(BPF_ENV_MNT);
-	static const char * const bpf_known_mnts[] = {
-		BPF_DIR_MNT,
-		"/bpf",
-		0,
-	};
-	int ret;
-
-	if (bpf_mnt_cached) {
-		const char *out = mnt;
-
-		if (out && type) {
-			snprintf(bpf_tmp, sizeof(bpf_tmp), "%s%s/",
-				 out, bpf_prog_to_subdir(type));
-			out = bpf_tmp;
-		}
-		return out;
-	}
-
-	if (mnt_env)
-		mnt = bpf_find_mntpt_single(BPF_FS_MAGIC, bpf_tmp,
-					    sizeof(bpf_tmp), mnt_env);
-	else
-		mnt = bpf_find_mntpt("bpf", BPF_FS_MAGIC, bpf_tmp,
-				     sizeof(bpf_tmp), bpf_known_mnts);
-	if (!mnt) {
-		mnt = mnt_env ? : BPF_DIR_MNT;
-		ret = bpf_mnt_check_target(mnt);
-		if (!ret)
-			ret = bpf_mnt_fs(mnt);
-		if (ret) {
-			mnt = NULL;
-			goto out;
-		}
-	}
-
-	ret = snprintf(bpf_wrk_dir, sizeof(bpf_wrk_dir), "%s/", mnt);
-	if (ret < 0 || ret >= sizeof(bpf_wrk_dir)) {
-		mnt = NULL;
-		goto out;
-	}
-
-	ret = bpf_gen_hierarchy(bpf_wrk_dir);
-	if (ret) {
-		mnt = NULL;
-		goto out;
-	}
-
-	mnt = bpf_wrk_dir;
-out:
-	bpf_mnt_cached = true;
-	return mnt;
-}
-
-static int bpf_obj_get(const char *pathname, enum bpf_prog_type type)
-{
-	union bpf_attr attr = {};
-	char tmp[PATH_MAX];
-
-	if (strlen(pathname) > 2 && pathname[0] == 'm' &&
-	    pathname[1] == ':' && bpf_get_work_dir(type)) {
-		snprintf(tmp, sizeof(tmp), "%s/%s",
-			 bpf_get_work_dir(type), pathname + 2);
-		pathname = tmp;
-	}
-
-	attr.pathname = bpf_ptr_to_u64(pathname);
-
-	return bpf(BPF_OBJ_GET, &attr, sizeof(attr));
-}
-
-static int bpf_obj_pinned(const char *pathname, enum bpf_prog_type type)
-{
-	int prog_fd = bpf_obj_get(pathname, type);
-
-	if (prog_fd < 0)
-		fprintf(stderr, "Couldn\'t retrieve pinned program \'%s\': %s\n",
-			pathname, strerror(errno));
-	return prog_fd;
-}
-
-static int bpf_do_parse(struct bpf_cfg_in *cfg, const bool *opt_tbl)
-{
-	const char *file, *section, *prog_name;
-	bool verbose = false;
-	int i, ret, argc;
-	char **argv;
-
-	argv = cfg->argv;
-	argc = cfg->argc;
-
-	if (opt_tbl[CBPF_BYTECODE] &&
-	    (matches(*argv, "bytecode") == 0 ||
-	     strcmp(*argv, "bc") == 0)) {
-		cfg->mode = CBPF_BYTECODE;
-	} else if (opt_tbl[CBPF_FILE] &&
-		   (matches(*argv, "bytecode-file") == 0 ||
-		    strcmp(*argv, "bcf") == 0)) {
-		cfg->mode = CBPF_FILE;
-	} else if (opt_tbl[EBPF_OBJECT] &&
-		   (matches(*argv, "object-file") == 0 ||
-		    strcmp(*argv, "obj") == 0)) {
-		cfg->mode = EBPF_OBJECT;
-	} else if (opt_tbl[EBPF_PINNED] &&
-		   (matches(*argv, "object-pinned") == 0 ||
-		    matches(*argv, "pinned") == 0 ||
-		    matches(*argv, "fd") == 0)) {
-		cfg->mode = EBPF_PINNED;
-	} else {
-		fprintf(stderr, "What mode is \"%s\"?\n", *argv);
-		return -1;
-	}
-
-	NEXT_ARG();
-	file = section = prog_name = NULL;
-	if (cfg->mode == EBPF_OBJECT || cfg->mode == EBPF_PINNED) {
-		file = *argv;
-		NEXT_ARG_FWD();
-
-		if (cfg->type == BPF_PROG_TYPE_UNSPEC) {
-			if (argc > 0 && matches(*argv, "type") == 0) {
-				NEXT_ARG();
-				for (i = 0; i < ARRAY_SIZE(__bpf_prog_meta);
-				     i++) {
-					if (!__bpf_prog_meta[i].type)
-						continue;
-					if (!matches(*argv,
-						     __bpf_prog_meta[i].type)) {
-						cfg->type = i;
-						break;
-					}
-				}
-
-				if (cfg->type == BPF_PROG_TYPE_UNSPEC) {
-					fprintf(stderr, "What type is \"%s\"?\n",
-						*argv);
-					return -1;
-				}
-				NEXT_ARG_FWD();
-			} else {
-				cfg->type = BPF_PROG_TYPE_SCHED_CLS;
-			}
-		}
-
-		section = bpf_prog_to_default_section(cfg->type);
-		if (argc > 0 && matches(*argv, "section") == 0) {
-			NEXT_ARG();
-			section = *argv;
-			NEXT_ARG_FWD();
-		}
-
-		if (argc > 0 && strcmp(*argv, "program") == 0) {
-			NEXT_ARG();
-			prog_name = *argv;
-			NEXT_ARG_FWD();
-		}
-
-		if (argc > 0 && matches(*argv, "verbose") == 0) {
-			verbose = true;
-			NEXT_ARG_FWD();
-		}
-
-		PREV_ARG();
-	}
-
-	if (cfg->mode == CBPF_BYTECODE || cfg->mode == CBPF_FILE) {
-		ret = bpf_ops_parse(argc, argv, cfg->opcodes,
-				    cfg->mode == CBPF_FILE);
-		cfg->n_opcodes = ret;
-	} else if (cfg->mode == EBPF_OBJECT) {
-		ret = 0; /* program will be loaded by load stage */
-	} else if (cfg->mode == EBPF_PINNED) {
-		ret = bpf_obj_pinned(file, cfg->type);
-		cfg->prog_fd = ret;
-	} else {
-		return -1;
-	}
-
-	cfg->object  = file;
-	cfg->section = section;
-	cfg->argc    = argc;
-	cfg->argv    = argv;
-	cfg->verbose = verbose;
-	cfg->prog_name = prog_name;
-
-	return ret;
-}
-
-static int bpf_do_load(struct bpf_cfg_in *cfg)
-{
-	if (cfg->mode == EBPF_OBJECT) {
-#ifdef HAVE_LIBBPF
-		return iproute2_load_libbpf(cfg);
-#endif
-		cfg->prog_fd = bpf_obj_open(cfg->object, cfg->type,
-					    cfg->section, cfg->ifindex,
-					    cfg->verbose);
-		return cfg->prog_fd;
-	}
-	return 0;
-}
-
-int bpf_load_common(struct bpf_cfg_in *cfg, const struct bpf_cfg_ops *ops,
-		    void *nl)
-{
-	char annotation[256];
-	int ret;
-
-	ret = bpf_do_load(cfg);
-	if (ret < 0)
-		return ret;
-
-	if (cfg->mode == CBPF_BYTECODE || cfg->mode == CBPF_FILE)
-		ops->cbpf_cb(nl, cfg->opcodes, cfg->n_opcodes);
-	if (cfg->mode == EBPF_OBJECT || cfg->mode == EBPF_PINNED) {
-		snprintf(annotation, sizeof(annotation), "%s:[%s]",
-			 basename(strdupa(cfg->object)),
-			 cfg->mode == EBPF_PINNED ? "*fsobj" : cfg->section);
-		ops->ebpf_cb(nl, cfg->prog_fd, annotation);
-	}
-
-	return 0;
-}
-
-int bpf_parse_common(struct bpf_cfg_in *cfg, const struct bpf_cfg_ops *ops)
-{
-	bool opt_tbl[BPF_MODE_MAX] = {};
-
-	if (ops->cbpf_cb) {
-		opt_tbl[CBPF_BYTECODE] = true;
-		opt_tbl[CBPF_FILE]     = true;
-	}
-
-	if (ops->ebpf_cb) {
-		opt_tbl[EBPF_OBJECT]   = true;
-		opt_tbl[EBPF_PINNED]   = true;
-	}
-
-	return bpf_do_parse(cfg, opt_tbl);
-}
-
-int bpf_parse_and_load_common(struct bpf_cfg_in *cfg,
-			      const struct bpf_cfg_ops *ops, void *nl)
-{
-	int ret;
-
-	ret = bpf_parse_common(cfg, ops);
-	if (ret < 0)
-		return ret;
-
-	return bpf_load_common(cfg, ops, nl);
-}
-
-int bpf_graft_map(const char *map_path, uint32_t *key, int argc, char **argv)
-{
-	const bool opt_tbl[BPF_MODE_MAX] = {
-		[EBPF_OBJECT]	= true,
-		[EBPF_PINNED]	= true,
-	};
-	const struct bpf_elf_map test = {
-		.type		= BPF_MAP_TYPE_PROG_ARRAY,
-		.size_key	= sizeof(int),
-		.size_value	= sizeof(int),
-	};
-	struct bpf_cfg_in cfg = {
-		.type		= BPF_PROG_TYPE_UNSPEC,
-		.argc		= argc,
-		.argv		= argv,
-	};
-	struct bpf_map_ext ext = {};
-	int ret, prog_fd, map_fd;
-	uint32_t map_key;
-
-	ret = bpf_do_parse(&cfg, opt_tbl);
-	if (ret < 0)
-		return ret;
-
-	ret = bpf_do_load(&cfg);
-	if (ret < 0)
-		return ret;
-
-	prog_fd = cfg.prog_fd;
-
-	if (key) {
-		map_key = *key;
-	} else {
-		ret = sscanf(cfg.section, "%*i/%i", &map_key);
-		if (ret != 1) {
-			fprintf(stderr, "Couldn\'t infer map key from section name! Please provide \'key\' argument!\n");
-			ret = -EINVAL;
-			goto out_prog;
-		}
-	}
-
-	map_fd = bpf_obj_get(map_path, cfg.type);
-	if (map_fd < 0) {
-		fprintf(stderr, "Couldn\'t retrieve pinned map \'%s\': %s\n",
-			map_path, strerror(errno));
-		ret = map_fd;
-		goto out_prog;
-	}
-
-	ret = bpf_map_selfcheck_pinned(map_fd, &test, &ext,
-				       offsetof(struct bpf_elf_map, max_elem),
-				       cfg.type);
-	if (ret < 0) {
-		fprintf(stderr, "Map \'%s\' self-check failed!\n", map_path);
-		goto out_map;
-	}
-
-	ret = bpf_map_update(map_fd, &map_key, &prog_fd, BPF_ANY);
-	if (ret < 0)
-		fprintf(stderr, "Map update failed: %s\n", strerror(errno));
-out_map:
-	close(map_fd);
-out_prog:
-	close(prog_fd);
-	return ret;
-}
-
-int bpf_prog_attach_fd(int prog_fd, int target_fd, enum bpf_attach_type type)
-{
-	union bpf_attr attr = {};
-
-	attr.target_fd = target_fd;
-	attr.attach_bpf_fd = prog_fd;
-	attr.attach_type = type;
-
-	return bpf(BPF_PROG_ATTACH, &attr, sizeof(attr));
-}
-
-int bpf_prog_detach_fd(int target_fd, enum bpf_attach_type type)
-{
-	union bpf_attr attr = {};
-
-	attr.target_fd = target_fd;
-	attr.attach_type = type;
-
-	return bpf(BPF_PROG_DETACH, &attr, sizeof(attr));
-}
-
-int bpf_prog_load_dev(enum bpf_prog_type type, const struct bpf_insn *insns,
-		      size_t size_insns, const char *license, __u32 ifindex,
-		      char *log, size_t size_log, bool verbose)
-{
-	union bpf_attr attr = {};
-
-	attr.prog_type = type;
-	attr.insns = bpf_ptr_to_u64(insns);
-	attr.insn_cnt = size_insns / sizeof(struct bpf_insn);
-	attr.license = bpf_ptr_to_u64(license);
-	attr.prog_ifindex = ifindex;
-
-	if (size_log > 0) {
-		attr.log_buf = bpf_ptr_to_u64(log);
-		attr.log_size = size_log;
-		attr.log_level = 1;
-		if (verbose)
-			attr.log_level |= 2;
-	}
-
-	return bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
-}
-
-int bpf_program_load(enum bpf_prog_type type, const struct bpf_insn *insns,
-		     size_t size_insns, const char *license, char *log,
-		     size_t size_log, bool verbose)
-{
-	return bpf_prog_load_dev(type, insns, size_insns, license, 0, log, size_log, verbose);
-}
-
-#ifdef HAVE_ELF
-struct bpf_elf_prog {
-	enum bpf_prog_type	type;
-	struct bpf_insn		*insns;
-	unsigned int		insns_num;
-	size_t			size;
-	const char		*license;
-};
-
-struct bpf_hash_entry {
-	unsigned int		pinning;
-	const char		*subpath;
-	struct bpf_hash_entry	*next;
-};
-
-struct bpf_config {
-	unsigned int		jit_enabled;
-};
-
-struct bpf_btf {
-	const struct btf_header	*hdr;
-	const void		*raw;
-	const char		*strings;
-	const struct btf_type	**types;
-	int			types_num;
-};
-
-struct bpf_elf_ctx {
-	struct bpf_config	cfg;
-	Elf			*elf_fd;
-	GElf_Ehdr		elf_hdr;
-	Elf_Data		*sym_tab;
-	Elf_Data		*str_tab;
-	Elf_Data		*btf_data;
-	char			obj_uid[64];
-	int			obj_fd;
-	int			btf_fd;
-	int			map_fds[ELF_MAX_MAPS];
-	struct bpf_elf_map	maps[ELF_MAX_MAPS];
-	struct bpf_map_ext	maps_ext[ELF_MAX_MAPS];
-	struct bpf_elf_prog	prog_text;
-	struct bpf_btf		btf;
-	int			sym_num;
-	int			map_num;
-	int			map_len;
-	bool			*sec_done;
-	int			sec_maps;
-	int			sec_text;
-	int			sec_btf;
-	char			license[ELF_MAX_LICENSE_LEN];
-	enum bpf_prog_type	type;
-	__u32			ifindex;
-	bool			verbose;
-	struct bpf_hash_entry	*ht[256];
-	char			*log;
-	size_t			log_size;
-};
-
-struct bpf_elf_sec_data {
-	GElf_Shdr		sec_hdr;
-	Elf_Data		*sec_data;
-	const char		*sec_name;
-};
-
-static bool bpf_log_has_data(struct bpf_elf_ctx *ctx)
-{
-	return ctx->log && ctx->log[0];
-}
-
-static __check_format_string(2, 3) void
-bpf_dump_error(struct bpf_elf_ctx *ctx, const char *format, ...)
-{
-	va_list vl;
-
-	va_start(vl, format);
-	vfprintf(stderr, format, vl);
-	va_end(vl);
-
-	if (bpf_log_has_data(ctx)) {
-		if (ctx->verbose) {
-			fprintf(stderr, "%s\n", ctx->log);
-		} else {
-			unsigned int off = 0, len = strlen(ctx->log);
-
-			if (len > BPF_MAX_LOG) {
-				off = len - BPF_MAX_LOG;
-				fprintf(stderr, "Skipped %u bytes, use \'verb\' option for the full verbose log.\n[...]\n",
-					off);
-			}
-			fprintf(stderr, "%s\n", ctx->log + off);
-		}
-
-		memset(ctx->log, 0, ctx->log_size);
-	}
-}
-
-static int bpf_log_realloc(struct bpf_elf_ctx *ctx)
-{
-	const size_t log_max = UINT_MAX >> 8;
-	size_t log_size = ctx->log_size;
-	char *ptr;
-
-	if (!ctx->log) {
-		log_size = 65536;
-	} else if (log_size < log_max) {
-		log_size <<= 1;
-		if (log_size > log_max)
-			log_size = log_max;
-	} else {
-		return -EINVAL;
-	}
-
-	ptr = realloc(ctx->log, log_size);
-	if (!ptr)
-		return -ENOMEM;
-
-	ptr[0] = 0;
-	ctx->log = ptr;
-	ctx->log_size = log_size;
-
-	return 0;
-}
-
-static int bpf_map_create(enum bpf_map_type type, uint32_t size_key,
-			  uint32_t size_value, uint32_t max_elem,
-			  uint32_t flags, int inner_fd, int btf_fd,
-			  uint32_t ifindex, uint32_t btf_id_key,
-			  uint32_t btf_id_val)
-{
-	union bpf_attr attr = {};
-
-	attr.map_type = type;
-	attr.key_size = size_key;
-	attr.value_size = inner_fd ? sizeof(int) : size_value;
-	attr.max_entries = max_elem;
-	attr.map_flags = flags;
-	attr.inner_map_fd = inner_fd;
-	attr.map_ifindex = ifindex;
-	attr.btf_fd = btf_fd;
-	attr.btf_key_type_id = btf_id_key;
-	attr.btf_value_type_id = btf_id_val;
-
-	return bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
-}
-
-static int bpf_btf_load(void *btf, size_t size_btf,
-			char *log, size_t size_log)
-{
-	union bpf_attr attr = {};
-
-	attr.btf = bpf_ptr_to_u64(btf);
-	attr.btf_size = size_btf;
-
-	if (size_log > 0) {
-		attr.btf_log_buf = bpf_ptr_to_u64(log);
-		attr.btf_log_size = size_log;
-		attr.btf_log_level = 1;
-	}
-
-	return bpf(BPF_BTF_LOAD, &attr, sizeof(attr));
-}
-
-static int bpf_obj_pin(int fd, const char *pathname)
-{
-	union bpf_attr attr = {};
-
-	attr.pathname = bpf_ptr_to_u64(pathname);
-	attr.bpf_fd = fd;
-
-	return bpf(BPF_OBJ_PIN, &attr, sizeof(attr));
-}
-
-static int bpf_obj_hash(int fd, const char *object, __u8 out[SHA1_DIGEST_SIZE])
-{
-	struct stat stbuff;
-	void *data;
-
-	if (fstat(fd, &stbuff) < 0) {
-		fprintf(stderr, "Error doing fstat: %s\n", strerror(errno));
-		return -1;
-	}
-	if ((size_t)stbuff.st_size != stbuff.st_size) {
-		fprintf(stderr, "Object %s is too big\n", object);
-		return -EFBIG;
-	}
-	data = mmap(NULL, stbuff.st_size, PROT_READ, MAP_SHARED, fd, 0);
-	if (data == MAP_FAILED) {
-		fprintf(stderr, "Error mapping object %s: %s\n", object,
-			strerror(errno));
-		return -1;
-	}
-	sha1(data, stbuff.st_size, out);
-	munmap(data, stbuff.st_size);
-	return 0;
-}
-
-static void bpf_init_env(void)
-{
-	struct rlimit limit = {
-		.rlim_cur = RLIM_INFINITY,
-		.rlim_max = RLIM_INFINITY,
-	};
-
-	/* Don't bother in case we fail! */
-	setrlimit(RLIMIT_MEMLOCK, &limit);
-
-	if (!bpf_get_work_dir(BPF_PROG_TYPE_UNSPEC))
-		fprintf(stderr, "Continuing without mounted eBPF fs. Too old kernel?\n");
-}
-
-static const char *bpf_custom_pinning(const struct bpf_elf_ctx *ctx,
-				      uint32_t pinning)
-{
-	struct bpf_hash_entry *entry;
-
-	entry = ctx->ht[pinning & (ARRAY_SIZE(ctx->ht) - 1)];
-	while (entry && entry->pinning != pinning)
-		entry = entry->next;
-
-	return entry ? entry->subpath : NULL;
-}
-
-static bool bpf_no_pinning(const struct bpf_elf_ctx *ctx,
-			   uint32_t pinning)
-{
-	switch (pinning) {
-	case PIN_OBJECT_NS:
-	case PIN_GLOBAL_NS:
-		return false;
-	case PIN_NONE:
-		return true;
-	default:
-		return !bpf_custom_pinning(ctx, pinning);
-	}
-}
-
-static void bpf_make_pathname(char *pathname, size_t len, const char *name,
-			      const struct bpf_elf_ctx *ctx, uint32_t pinning)
-{
-	switch (pinning) {
-	case PIN_OBJECT_NS:
-		snprintf(pathname, len, "%s/%s/%s",
-			 bpf_get_work_dir(ctx->type),
-			 ctx->obj_uid, name);
-		break;
-	case PIN_GLOBAL_NS:
-		snprintf(pathname, len, "%s/%s/%s",
-			 bpf_get_work_dir(ctx->type),
-			 BPF_DIR_GLOBALS, name);
-		break;
-	default:
-		snprintf(pathname, len, "%s/../%s/%s",
-			 bpf_get_work_dir(ctx->type),
-			 bpf_custom_pinning(ctx, pinning), name);
-		break;
-	}
-}
-
-static int bpf_probe_pinned(const char *name, const struct bpf_elf_ctx *ctx,
-			    uint32_t pinning)
-{
-	char pathname[PATH_MAX];
-
-	if (bpf_no_pinning(ctx, pinning) || !bpf_get_work_dir(ctx->type))
-		return 0;
-
-	bpf_make_pathname(pathname, sizeof(pathname), name, ctx, pinning);
-	return bpf_obj_get(pathname, ctx->type);
-}
-
-static int bpf_make_obj_path(const struct bpf_elf_ctx *ctx)
-{
-	char tmp[PATH_MAX];
-	int ret;
-
-	snprintf(tmp, sizeof(tmp), "%s/%s", bpf_get_work_dir(ctx->type),
-		 ctx->obj_uid);
-
-	ret = mkdir(tmp, S_IRWXU);
-	if (ret && errno != EEXIST) {
-		fprintf(stderr, "mkdir %s failed: %s\n", tmp, strerror(errno));
-		return ret;
-	}
-
-	return 0;
-}
-
-static int bpf_make_custom_path(const struct bpf_elf_ctx *ctx,
-				const char *todo)
-{
-	char tmp[PATH_MAX], rem[PATH_MAX], *sub;
-	int ret;
-
-	snprintf(tmp, sizeof(tmp), "%s/../", bpf_get_work_dir(ctx->type));
-	snprintf(rem, sizeof(rem), "%s/", todo);
-	sub = strtok(rem, "/");
-
-	while (sub) {
-		if (strlen(tmp) + strlen(sub) + 2 > PATH_MAX)
-			return -EINVAL;
-
-		strcat(tmp, sub);
-		strcat(tmp, "/");
-
-		ret = mkdir(tmp, S_IRWXU);
-		if (ret && errno != EEXIST) {
-			fprintf(stderr, "mkdir %s failed: %s\n", tmp,
-				strerror(errno));
-			return ret;
-		}
-
-		sub = strtok(NULL, "/");
-	}
-
-	return 0;
-}
-
-static int bpf_place_pinned(int fd, const char *name,
-			    const struct bpf_elf_ctx *ctx, uint32_t pinning)
-{
-	char pathname[PATH_MAX];
-	const char *tmp;
-	int ret = 0;
-
-	if (bpf_no_pinning(ctx, pinning) || !bpf_get_work_dir(ctx->type))
-		return 0;
-
-	if (pinning == PIN_OBJECT_NS)
-		ret = bpf_make_obj_path(ctx);
-	else if ((tmp = bpf_custom_pinning(ctx, pinning)))
-		ret = bpf_make_custom_path(ctx, tmp);
-	if (ret < 0)
-		return ret;
-
-	bpf_make_pathname(pathname, sizeof(pathname), name, ctx, pinning);
-	return bpf_obj_pin(fd, pathname);
-}
-
-static void bpf_prog_report(int fd, const char *section,
-			    const struct bpf_elf_prog *prog,
-			    struct bpf_elf_ctx *ctx)
-{
-	unsigned int insns = prog->size / sizeof(struct bpf_insn);
-
-	fprintf(stderr, "\nProg section \'%s\' %s%s (%d)!\n", section,
-		fd < 0 ? "rejected: " : "loaded",
-		fd < 0 ? strerror(errno) : "",
-		fd < 0 ? errno : fd);
-
-	fprintf(stderr, " - Type:         %u\n", prog->type);
-	fprintf(stderr, " - Instructions: %u (%u over limit)\n",
-		insns, insns > BPF_MAXINSNS ? insns - BPF_MAXINSNS : 0);
-	fprintf(stderr, " - License:      %s\n\n", prog->license);
-
-	bpf_dump_error(ctx, "Verifier analysis:\n\n");
-}
-
-static int bpf_prog_attach(const char *section,
-			   const struct bpf_elf_prog *prog,
-			   struct bpf_elf_ctx *ctx)
-{
-	int tries = 0, fd;
-retry:
-	errno = 0;
-	fd = bpf_prog_load_dev(prog->type, prog->insns, prog->size,
-			       prog->license, ctx->ifindex,
-			       ctx->log, ctx->log_size, ctx->verbose);
-	if (fd < 0 || ctx->verbose) {
-		/* The verifier log is pretty chatty, sometimes so chatty
-		 * on larger programs, that we could fail to dump everything
-		 * into our buffer. Still, try to give a debuggable error
-		 * log for the user, so enlarge it and re-fail.
-		 */
-		if (fd < 0 && errno == ENOSPC) {
-			if (tries++ < 10 && !bpf_log_realloc(ctx))
-				goto retry;
-
-			fprintf(stderr, "Log buffer too small to dump verifier log %zu bytes (%d tries)!\n",
-				ctx->log_size, tries);
-			return fd;
-		}
-
-		bpf_prog_report(fd, section, prog, ctx);
-	}
-
-	return fd;
-}
-
-static void bpf_map_report(int fd, const char *name,
-			   const struct bpf_elf_map *map,
-			   struct bpf_elf_ctx *ctx, int inner_fd)
-{
-	fprintf(stderr, "Map object \'%s\' %s%s (%d)!\n", name,
-		fd < 0 ? "rejected: " : "loaded",
-		fd < 0 ? strerror(errno) : "",
-		fd < 0 ? errno : fd);
-
-	fprintf(stderr, " - Type:         %u\n", map->type);
-	fprintf(stderr, " - Identifier:   %u\n", map->id);
-	fprintf(stderr, " - Pinning:      %u\n", map->pinning);
-	fprintf(stderr, " - Size key:     %u\n", map->size_key);
-	fprintf(stderr, " - Size value:   %u\n",
-		inner_fd ? (int)sizeof(int) : map->size_value);
-	fprintf(stderr, " - Max elems:    %u\n", map->max_elem);
-	fprintf(stderr, " - Flags:        %#x\n\n", map->flags);
-}
-
-static int bpf_find_map_id(const struct bpf_elf_ctx *ctx, uint32_t id)
-{
-	int i;
-
-	for (i = 0; i < ctx->map_num; i++) {
-		if (ctx->maps[i].id != id)
-			continue;
-		if (ctx->map_fds[i] < 0)
-			return -EINVAL;
-
-		return ctx->map_fds[i];
-	}
-
-	return -ENOENT;
-}
-
-static void bpf_report_map_in_map(int outer_fd, uint32_t idx)
-{
-	struct bpf_elf_map outer_map;
-	int ret;
-
-	fprintf(stderr, "Cannot insert map into map! ");
-
-	ret = bpf_derive_elf_map_from_fdinfo(outer_fd, &outer_map, NULL);
-	if (!ret) {
-		if (idx >= outer_map.max_elem &&
-		    outer_map.type == BPF_MAP_TYPE_ARRAY_OF_MAPS) {
-			fprintf(stderr, "Outer map has %u elements, index %u is invalid!\n",
-				outer_map.max_elem, idx);
-			return;
-		}
-	}
-
-	fprintf(stderr, "Different map specs used for outer and inner map?\n");
-}
-
-static bool bpf_is_map_in_map_type(const struct bpf_elf_map *map)
-{
-	return map->type == BPF_MAP_TYPE_ARRAY_OF_MAPS ||
-	       map->type == BPF_MAP_TYPE_HASH_OF_MAPS;
-}
-
-static bool bpf_map_offload_neutral(enum bpf_map_type type)
-{
-	return type == BPF_MAP_TYPE_PERF_EVENT_ARRAY;
-}
-
-static int bpf_map_attach(const char *name, struct bpf_elf_ctx *ctx,
-			  const struct bpf_elf_map *map, struct bpf_map_ext *ext,
-			  int *have_map_in_map)
-{
-	int fd, ifindex, ret, map_inner_fd = 0;
-	bool retried = false;
-
-probe:
-	fd = bpf_probe_pinned(name, ctx, map->pinning);
-	if (fd > 0) {
-		ret = bpf_map_selfcheck_pinned(fd, map, ext,
-					       offsetof(struct bpf_elf_map,
-							id), ctx->type);
-		if (ret < 0) {
-			close(fd);
-			fprintf(stderr, "Map \'%s\' self-check failed!\n",
-				name);
-			return ret;
-		}
-		if (ctx->verbose)
-			fprintf(stderr, "Map \'%s\' loaded as pinned!\n",
-				name);
-		return fd;
-	}
-
-	if (have_map_in_map && bpf_is_map_in_map_type(map)) {
-		(*have_map_in_map)++;
-		if (map->inner_id)
-			return 0;
-		fprintf(stderr, "Map \'%s\' cannot be created since no inner map ID defined!\n",
-			name);
-		return -EINVAL;
-	}
-
-	if (!have_map_in_map && bpf_is_map_in_map_type(map)) {
-		map_inner_fd = bpf_find_map_id(ctx, map->inner_id);
-		if (map_inner_fd < 0) {
-			fprintf(stderr, "Map \'%s\' cannot be loaded. Inner map with ID %u not found!\n",
-				name, map->inner_id);
-			return -EINVAL;
-		}
-	}
-
-	ifindex = bpf_map_offload_neutral(map->type) ? 0 : ctx->ifindex;
-	errno = 0;
-	fd = bpf_map_create(map->type, map->size_key, map->size_value,
-			    map->max_elem, map->flags, map_inner_fd, ctx->btf_fd,
-			    ifindex, ext->btf_id_key, ext->btf_id_val);
-
-	if (fd < 0 || ctx->verbose) {
-		bpf_map_report(fd, name, map, ctx, map_inner_fd);
-		if (fd < 0)
-			return fd;
-	}
-
-	ret = bpf_place_pinned(fd, name, ctx, map->pinning);
-	if (ret < 0) {
-		close(fd);
-		if (!retried && errno == EEXIST) {
-			retried = true;
-			goto probe;
-		}
-		fprintf(stderr, "Could not pin %s map: %s\n", name,
-			strerror(errno));
-		return ret;
-	}
-
-	return fd;
-}
-
-static const char *bpf_str_tab_name(const struct bpf_elf_ctx *ctx,
-				    const GElf_Sym *sym)
-{
-	return ctx->str_tab->d_buf + sym->st_name;
-}
-
-static int bpf_btf_find(struct bpf_elf_ctx *ctx, const char *name)
-{
-	const struct btf_type *type;
-	const char *res;
-	int id;
-
-	for (id = 1; id < ctx->btf.types_num; id++) {
-		type = ctx->btf.types[id];
-		if (type->name_off >= ctx->btf.hdr->str_len)
-			continue;
-		res = &ctx->btf.strings[type->name_off];
-		if (!strcmp(res, name))
-			return id;
-	}
-
-	return -ENOENT;
-}
-
-static int bpf_btf_find_kv(struct bpf_elf_ctx *ctx, const struct bpf_elf_map *map,
-			   const char *name, uint32_t *id_key, uint32_t *id_val)
-{
-	const struct btf_member *key, *val;
-	const struct btf_type *type;
-	char btf_name[512];
-	const char *res;
-	int id;
-
-	snprintf(btf_name, sizeof(btf_name), "____btf_map_%s", name);
-	id = bpf_btf_find(ctx, btf_name);
-	if (id < 0)
-		return id;
-
-	type = ctx->btf.types[id];
-	if (BTF_INFO_KIND(type->info) != BTF_KIND_STRUCT)
-		return -EINVAL;
-	if (BTF_INFO_VLEN(type->info) != 2)
-		return -EINVAL;
-
-	key = ((void *) type) + sizeof(*type);
-	val = key + 1;
-	if (!key->type || key->type >= ctx->btf.types_num ||
-	    !val->type || val->type >= ctx->btf.types_num)
-		return -EINVAL;
-
-	if (key->name_off >= ctx->btf.hdr->str_len ||
-	    val->name_off >= ctx->btf.hdr->str_len)
-		return -EINVAL;
-
-	res = &ctx->btf.strings[key->name_off];
-	if (strcmp(res, "key"))
-		return -EINVAL;
-
-	res = &ctx->btf.strings[val->name_off];
-	if (strcmp(res, "value"))
-		return -EINVAL;
-
-	*id_key = key->type;
-	*id_val = val->type;
-	return 0;
-}
-
-static void bpf_btf_annotate(struct bpf_elf_ctx *ctx, int which, const char *name)
-{
-	uint32_t id_key = 0, id_val = 0;
-
-	if (!bpf_btf_find_kv(ctx, &ctx->maps[which], name, &id_key, &id_val)) {
-		ctx->maps_ext[which].btf_id_key = id_key;
-		ctx->maps_ext[which].btf_id_val = id_val;
-	}
-}
-
-static const char *bpf_map_fetch_name(struct bpf_elf_ctx *ctx, int which)
-{
-	const char *name;
-	GElf_Sym sym;
-	int i;
-
-	for (i = 0; i < ctx->sym_num; i++) {
-		int type;
-
-		if (gelf_getsym(ctx->sym_tab, i, &sym) != &sym)
-			continue;
-
-		type = GELF_ST_TYPE(sym.st_info);
-		if (GELF_ST_BIND(sym.st_info) != STB_GLOBAL ||
-		    (type != STT_NOTYPE && type != STT_OBJECT) ||
-		    sym.st_shndx != ctx->sec_maps ||
-		    sym.st_value / ctx->map_len != which)
-			continue;
-
-		name = bpf_str_tab_name(ctx, &sym);
-		bpf_btf_annotate(ctx, which, name);
-		return name;
-	}
-
-	return NULL;
-}
-
-static int bpf_maps_attach_all(struct bpf_elf_ctx *ctx)
-{
-	int i, j, ret, fd, inner_fd, inner_idx, have_map_in_map = 0;
-	const char *map_name;
-
-	for (i = 0; i < ctx->map_num; i++) {
-		map_name = bpf_map_fetch_name(ctx, i);
-		if (!map_name)
-			return -EIO;
-
-		fd = bpf_map_attach(map_name, ctx, &ctx->maps[i],
-				    &ctx->maps_ext[i], &have_map_in_map);
-		if (fd < 0)
-			return fd;
-
-		ctx->map_fds[i] = !fd ? -1 : fd;
-	}
-
-	for (i = 0; have_map_in_map && i < ctx->map_num; i++) {
-		if (ctx->map_fds[i] >= 0)
-			continue;
-
-		map_name = bpf_map_fetch_name(ctx, i);
-		if (!map_name)
-			return -EIO;
-
-		fd = bpf_map_attach(map_name, ctx, &ctx->maps[i],
-				    &ctx->maps_ext[i], NULL);
-		if (fd < 0)
-			return fd;
-
-		ctx->map_fds[i] = fd;
-	}
-
-	for (i = 0; have_map_in_map && i < ctx->map_num; i++) {
-		if (!ctx->maps[i].id ||
-		    ctx->maps[i].inner_id ||
-		    ctx->maps[i].inner_idx == -1)
-			continue;
-
-		inner_fd  = ctx->map_fds[i];
-		inner_idx = ctx->maps[i].inner_idx;
-
-		for (j = 0; j < ctx->map_num; j++) {
-			if (!bpf_is_map_in_map_type(&ctx->maps[j]))
-				continue;
-			if (ctx->maps[j].inner_id != ctx->maps[i].id)
-				continue;
-
-			ret = bpf_map_update(ctx->map_fds[j], &inner_idx,
-					     &inner_fd, BPF_ANY);
-			if (ret < 0) {
-				bpf_report_map_in_map(ctx->map_fds[j],
-						      inner_idx);
-				return ret;
-			}
-		}
-	}
-
-	return 0;
-}
-
-static int bpf_map_num_sym(struct bpf_elf_ctx *ctx)
-{
-	int i, num = 0;
-	GElf_Sym sym;
-
-	for (i = 0; i < ctx->sym_num; i++) {
-		int type;
-
-		if (gelf_getsym(ctx->sym_tab, i, &sym) != &sym)
-			continue;
-
-		type = GELF_ST_TYPE(sym.st_info);
-		if (GELF_ST_BIND(sym.st_info) != STB_GLOBAL ||
-		    (type != STT_NOTYPE && type != STT_OBJECT) ||
-		    sym.st_shndx != ctx->sec_maps)
-			continue;
-		num++;
-	}
-
-	return num;
-}
-
-static int bpf_fill_section_data(struct bpf_elf_ctx *ctx, int section,
-				 struct bpf_elf_sec_data *data)
-{
-	Elf_Data *sec_edata;
-	GElf_Shdr sec_hdr;
-	Elf_Scn *sec_fd;
-	char *sec_name;
-
-	memset(data, 0, sizeof(*data));
-
-	sec_fd = elf_getscn(ctx->elf_fd, section);
-	if (!sec_fd)
-		return -EINVAL;
-	if (gelf_getshdr(sec_fd, &sec_hdr) != &sec_hdr)
-		return -EIO;
-
-	sec_name = elf_strptr(ctx->elf_fd, ctx->elf_hdr.e_shstrndx,
-			      sec_hdr.sh_name);
-	if (!sec_name || !sec_hdr.sh_size)
-		return -ENOENT;
-
-	sec_edata = elf_getdata(sec_fd, NULL);
-	if (!sec_edata || elf_getdata(sec_fd, sec_edata))
-		return -EIO;
-
-	memcpy(&data->sec_hdr, &sec_hdr, sizeof(sec_hdr));
-
-	data->sec_name = sec_name;
-	data->sec_data = sec_edata;
-	return 0;
-}
-
-struct bpf_elf_map_min {
-	__u32 type;
-	__u32 size_key;
-	__u32 size_value;
-	__u32 max_elem;
-};
-
-static int bpf_fetch_maps_begin(struct bpf_elf_ctx *ctx, int section,
-				struct bpf_elf_sec_data *data)
-{
-	ctx->map_num = data->sec_data->d_size;
-	ctx->sec_maps = section;
-	ctx->sec_done[section] = true;
-
-	if (ctx->map_num > sizeof(ctx->maps)) {
-		fprintf(stderr, "Too many BPF maps in ELF section!\n");
-		return -ENOMEM;
-	}
-
-	memcpy(ctx->maps, data->sec_data->d_buf, ctx->map_num);
-	return 0;
-}
-
-static int bpf_map_verify_all_offs(struct bpf_elf_ctx *ctx, int end)
-{
-	GElf_Sym sym;
-	int off, i;
-
-	for (off = 0; off < end; off += ctx->map_len) {
-		/* Order doesn't need to be linear here, hence we walk
-		 * the table again.
-		 */
-		for (i = 0; i < ctx->sym_num; i++) {
-			int type;
-
-			if (gelf_getsym(ctx->sym_tab, i, &sym) != &sym)
-				continue;
-
-			type = GELF_ST_TYPE(sym.st_info);
-			if (GELF_ST_BIND(sym.st_info) != STB_GLOBAL ||
-			    (type != STT_NOTYPE && type != STT_OBJECT) ||
-			    sym.st_shndx != ctx->sec_maps)
-				continue;
-			if (sym.st_value == off)
-				break;
-			if (i == ctx->sym_num - 1)
-				return -1;
-		}
-	}
-
-	return off == end ? 0 : -1;
-}
-
-static int bpf_fetch_maps_end(struct bpf_elf_ctx *ctx)
-{
-	struct bpf_elf_map fixup[ARRAY_SIZE(ctx->maps)] = {};
-	int i, sym_num = bpf_map_num_sym(ctx);
-	__u8 *buff;
-
-	if (sym_num == 0 || sym_num > ARRAY_SIZE(ctx->maps)) {
-		fprintf(stderr, "%u maps not supported in current map section!\n",
-			sym_num);
-		return -EINVAL;
-	}
-
-	if (ctx->map_num % sym_num != 0 ||
-	    ctx->map_num % sizeof(__u32) != 0) {
-		fprintf(stderr, "Number BPF map symbols are not multiple of struct bpf_elf_map!\n");
-		return -EINVAL;
-	}
-
-	ctx->map_len = ctx->map_num / sym_num;
-	if (bpf_map_verify_all_offs(ctx, ctx->map_num)) {
-		fprintf(stderr, "Different struct bpf_elf_map in use!\n");
-		return -EINVAL;
-	}
-
-	if (ctx->map_len == sizeof(struct bpf_elf_map)) {
-		ctx->map_num = sym_num;
-		return 0;
-	} else if (ctx->map_len > sizeof(struct bpf_elf_map)) {
-		fprintf(stderr, "struct bpf_elf_map not supported, coming from future version?\n");
-		return -EINVAL;
-	} else if (ctx->map_len < sizeof(struct bpf_elf_map_min)) {
-		fprintf(stderr, "struct bpf_elf_map too small, not supported!\n");
-		return -EINVAL;
-	}
-
-	ctx->map_num = sym_num;
-	for (i = 0, buff = (void *)ctx->maps; i < ctx->map_num;
-	     i++, buff += ctx->map_len) {
-		/* The fixup leaves the rest of the members as zero, which
-		 * is fine currently, but option exist to set some other
-		 * default value as well when needed in future.
-		 */
-		memcpy(&fixup[i], buff, ctx->map_len);
-	}
-
-	memcpy(ctx->maps, fixup, sizeof(fixup));
-	if (ctx->verbose)
-		printf("%zu bytes struct bpf_elf_map fixup performed due to size mismatch!\n",
-		       sizeof(struct bpf_elf_map) - ctx->map_len);
-	return 0;
-}
-
-static int bpf_fetch_license(struct bpf_elf_ctx *ctx, int section,
-			     struct bpf_elf_sec_data *data)
-{
-	if (data->sec_data->d_size > sizeof(ctx->license))
-		return -ENOMEM;
-
-	memcpy(ctx->license, data->sec_data->d_buf, data->sec_data->d_size);
-	ctx->sec_done[section] = true;
-	return 0;
-}
-
-static int bpf_fetch_symtab(struct bpf_elf_ctx *ctx, int section,
-			    struct bpf_elf_sec_data *data)
-{
-	ctx->sym_tab = data->sec_data;
-	ctx->sym_num = data->sec_hdr.sh_size / data->sec_hdr.sh_entsize;
-	ctx->sec_done[section] = true;
-	return 0;
-}
-
-static int bpf_fetch_strtab(struct bpf_elf_ctx *ctx, int section,
-			    struct bpf_elf_sec_data *data)
-{
-	ctx->str_tab = data->sec_data;
-	ctx->sec_done[section] = true;
-	return 0;
-}
-
-static int bpf_fetch_text(struct bpf_elf_ctx *ctx, int section,
-			  struct bpf_elf_sec_data *data)
-{
-	ctx->sec_text = section;
-	ctx->sec_done[section] = true;
-	return 0;
-}
-
-static void bpf_btf_report(int fd, struct bpf_elf_ctx *ctx)
-{
-	fprintf(stderr, "\nBTF debug data section \'.BTF\' %s%s (%d)!\n",
-		fd < 0 ? "rejected: " : "loaded",
-		fd < 0 ? strerror(errno) : "",
-		fd < 0 ? errno : fd);
-
-	fprintf(stderr, " - Length:       %zu\n", ctx->btf_data->d_size);
-
-	bpf_dump_error(ctx, "Verifier analysis:\n\n");
-}
-
-static int bpf_btf_attach(struct bpf_elf_ctx *ctx)
-{
-	int tries = 0, fd;
-retry:
-	errno = 0;
-	fd = bpf_btf_load(ctx->btf_data->d_buf, ctx->btf_data->d_size,
-			  ctx->log, ctx->log_size);
-	if (fd < 0 || ctx->verbose) {
-		if (fd < 0 && errno == ENOSPC) {
-			if (tries++ < 10 && !bpf_log_realloc(ctx))
-				goto retry;
-
-			fprintf(stderr, "Log buffer too small to dump verifier log %zu bytes (%d tries)!\n",
-				ctx->log_size, tries);
-			return fd;
-		}
-
-		if (bpf_log_has_data(ctx))
-			bpf_btf_report(fd, ctx);
-	}
-
-	return fd;
-}
-
-static int bpf_fetch_btf_begin(struct bpf_elf_ctx *ctx, int section,
-			       struct bpf_elf_sec_data *data)
-{
-	ctx->btf_data = data->sec_data;
-	ctx->sec_btf = section;
-	ctx->sec_done[section] = true;
-	return 0;
-}
-
-static int bpf_btf_check_header(struct bpf_elf_ctx *ctx)
-{
-	const struct btf_header *hdr = ctx->btf_data->d_buf;
-	const char *str_start, *str_end;
-	unsigned int data_len;
-
-	if (hdr->magic != BTF_MAGIC) {
-		fprintf(stderr, "Object has wrong BTF magic: %x, expected: %x!\n",
-			hdr->magic, BTF_MAGIC);
-		return -EINVAL;
-	}
-
-	if (hdr->version != BTF_VERSION) {
-		fprintf(stderr, "Object has wrong BTF version: %u, expected: %u!\n",
-			hdr->version, BTF_VERSION);
-		return -EINVAL;
-	}
-
-	if (hdr->flags) {
-		fprintf(stderr, "Object has unsupported BTF flags %x!\n",
-			hdr->flags);
-		return -EINVAL;
-	}
-
-	data_len = ctx->btf_data->d_size - sizeof(*hdr);
-	if (data_len < hdr->type_off ||
-	    data_len < hdr->str_off ||
-	    data_len < hdr->type_len + hdr->str_len ||
-	    hdr->type_off >= hdr->str_off ||
-	    hdr->type_off + hdr->type_len != hdr->str_off ||
-	    hdr->str_off + hdr->str_len != data_len ||
-	    (hdr->type_off & (sizeof(uint32_t) - 1))) {
-		fprintf(stderr, "Object has malformed BTF data!\n");
-		return -EINVAL;
-	}
-
-	ctx->btf.hdr = hdr;
-	ctx->btf.raw = hdr + 1;
-
-	str_start = ctx->btf.raw + hdr->str_off;
-	str_end = str_start + hdr->str_len;
-	if (!hdr->str_len ||
-	    hdr->str_len - 1 > BTF_MAX_NAME_OFFSET ||
-	    str_start[0] || str_end[-1]) {
-		fprintf(stderr, "Object has malformed BTF string data!\n");
-		return -EINVAL;
-	}
-
-	ctx->btf.strings = str_start;
-	return 0;
-}
-
-static int bpf_btf_register_type(struct bpf_elf_ctx *ctx,
-				 const struct btf_type *type)
-{
-	int cur = ctx->btf.types_num, num = cur + 1;
-	const struct btf_type **types;
-
-	types = realloc(ctx->btf.types, num * sizeof(type));
-	if (!types) {
-		free(ctx->btf.types);
-		ctx->btf.types = NULL;
-		ctx->btf.types_num = 0;
-		return -ENOMEM;
-	}
-
-	ctx->btf.types = types;
-	ctx->btf.types[cur] = type;
-	ctx->btf.types_num = num;
-	return 0;
-}
-
-static struct btf_type btf_type_void;
-
-static int bpf_btf_prep_type_data(struct bpf_elf_ctx *ctx)
-{
-	const void *type_cur = ctx->btf.raw + ctx->btf.hdr->type_off;
-	const void *type_end = ctx->btf.raw + ctx->btf.hdr->str_off;
-	const struct btf_type *type;
-	uint16_t var_len;
-	int ret, kind;
-
-	ret = bpf_btf_register_type(ctx, &btf_type_void);
-	if (ret < 0)
-		return ret;
-
-	while (type_cur < type_end) {
-		type = type_cur;
-		type_cur += sizeof(*type);
-
-		var_len = BTF_INFO_VLEN(type->info);
-		kind = BTF_INFO_KIND(type->info);
-
-		switch (kind) {
-		case BTF_KIND_INT:
-			type_cur += sizeof(int);
-			break;
-		case BTF_KIND_ARRAY:
-			type_cur += sizeof(struct btf_array);
-			break;
-		case BTF_KIND_STRUCT:
-		case BTF_KIND_UNION:
-			type_cur += var_len * sizeof(struct btf_member);
-			break;
-		case BTF_KIND_ENUM:
-			type_cur += var_len * sizeof(struct btf_enum);
-			break;
-		case BTF_KIND_FUNC_PROTO:
-			type_cur += var_len * sizeof(struct btf_param);
-			break;
-		case BTF_KIND_TYPEDEF:
-		case BTF_KIND_PTR:
-		case BTF_KIND_FWD:
-		case BTF_KIND_VOLATILE:
-		case BTF_KIND_CONST:
-		case BTF_KIND_RESTRICT:
-		case BTF_KIND_FUNC:
-			break;
-		default:
-			fprintf(stderr, "Object has unknown BTF type: %u!\n", kind);
-			return -EINVAL;
-		}
-
-		ret = bpf_btf_register_type(ctx, type);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int bpf_btf_prep_data(struct bpf_elf_ctx *ctx)
-{
-	int ret = bpf_btf_check_header(ctx);
-
-	if (!ret)
-		return bpf_btf_prep_type_data(ctx);
-	return ret;
-}
-
-static void bpf_fetch_btf_end(struct bpf_elf_ctx *ctx)
-{
-	int fd = bpf_btf_attach(ctx);
-
-	if (fd < 0)
-		return;
-	ctx->btf_fd = fd;
-	if (bpf_btf_prep_data(ctx) < 0) {
-		close(ctx->btf_fd);
-		ctx->btf_fd = 0;
-	}
-}
-
-static bool bpf_has_map_data(const struct bpf_elf_ctx *ctx)
-{
-	return ctx->sym_tab && ctx->str_tab && ctx->sec_maps;
-}
-
-static bool bpf_has_btf_data(const struct bpf_elf_ctx *ctx)
-{
-	return ctx->sec_btf;
-}
-
-static bool bpf_has_call_data(const struct bpf_elf_ctx *ctx)
-{
-	return ctx->sec_text;
-}
-
-static int bpf_fetch_ancillary(struct bpf_elf_ctx *ctx, bool check_text_sec)
-{
-	struct bpf_elf_sec_data data;
-	int i, ret = -1;
-
-	for (i = 1; i < ctx->elf_hdr.e_shnum; i++) {
-		ret = bpf_fill_section_data(ctx, i, &data);
-		if (ret < 0)
-			continue;
-
-		if (data.sec_hdr.sh_type == SHT_PROGBITS &&
-		    !strcmp(data.sec_name, ELF_SECTION_MAPS))
-			ret = bpf_fetch_maps_begin(ctx, i, &data);
-		else if (data.sec_hdr.sh_type == SHT_PROGBITS &&
-			 !strcmp(data.sec_name, ELF_SECTION_LICENSE))
-			ret = bpf_fetch_license(ctx, i, &data);
-		else if (data.sec_hdr.sh_type == SHT_PROGBITS &&
-			 (data.sec_hdr.sh_flags & SHF_EXECINSTR) &&
-			 !strcmp(data.sec_name, ".text") &&
-			 check_text_sec)
-			ret = bpf_fetch_text(ctx, i, &data);
-		else if (data.sec_hdr.sh_type == SHT_SYMTAB &&
-			 !strcmp(data.sec_name, ".symtab"))
-			ret = bpf_fetch_symtab(ctx, i, &data);
-		else if (data.sec_hdr.sh_type == SHT_STRTAB &&
-			 !strcmp(data.sec_name, ".strtab"))
-			ret = bpf_fetch_strtab(ctx, i, &data);
-		else if (data.sec_hdr.sh_type == SHT_PROGBITS &&
-			 !strcmp(data.sec_name, ".BTF"))
-			ret = bpf_fetch_btf_begin(ctx, i, &data);
-		if (ret < 0) {
-			fprintf(stderr, "Error parsing section %d! Perhaps check with readelf -a?\n",
-				i);
-			return ret;
-		}
-	}
-
-	if (bpf_has_btf_data(ctx))
-		bpf_fetch_btf_end(ctx);
-	if (bpf_has_map_data(ctx)) {
-		ret = bpf_fetch_maps_end(ctx);
-		if (ret < 0) {
-			fprintf(stderr, "Error fixing up map structure, incompatible struct bpf_elf_map used?\n");
-			return ret;
-		}
-
-		ret = bpf_maps_attach_all(ctx);
-		if (ret < 0) {
-			fprintf(stderr, "Error loading maps into kernel!\n");
-			return ret;
-		}
-	}
-
-	return ret;
-}
-
-static int bpf_fetch_prog(struct bpf_elf_ctx *ctx, const char *section,
-			  bool *sseen)
-{
-	struct bpf_elf_sec_data data;
-	struct bpf_elf_prog prog;
-	int ret, i, fd = -1;
-
-	for (i = 1; i < ctx->elf_hdr.e_shnum; i++) {
-		if (ctx->sec_done[i])
-			continue;
-
-		ret = bpf_fill_section_data(ctx, i, &data);
-		if (ret < 0 ||
-		    !(data.sec_hdr.sh_type == SHT_PROGBITS &&
-		      (data.sec_hdr.sh_flags & SHF_EXECINSTR) &&
-		      !strcmp(data.sec_name, section)))
-			continue;
-
-		*sseen = true;
-
-		memset(&prog, 0, sizeof(prog));
-		prog.type      = ctx->type;
-		prog.license   = ctx->license;
-		prog.size      = data.sec_data->d_size;
-		prog.insns_num = prog.size / sizeof(struct bpf_insn);
-		prog.insns     = data.sec_data->d_buf;
-
-		fd = bpf_prog_attach(section, &prog, ctx);
-		if (fd < 0)
-			return fd;
-
-		ctx->sec_done[i] = true;
-		break;
-	}
-
-	return fd;
-}
-
-struct bpf_relo_props {
-	struct bpf_tail_call {
-		unsigned int total;
-		unsigned int jited;
-	} tc;
-	int main_num;
-};
-
-static int bpf_apply_relo_map(struct bpf_elf_ctx *ctx, struct bpf_elf_prog *prog,
-			      GElf_Rel *relo, GElf_Sym *sym,
-			      struct bpf_relo_props *props)
-{
-	unsigned int insn_off = relo->r_offset / sizeof(struct bpf_insn);
-	unsigned int map_idx = sym->st_value / ctx->map_len;
-
-	if (insn_off >= prog->insns_num)
-		return -EINVAL;
-	if (prog->insns[insn_off].code != (BPF_LD | BPF_IMM | BPF_DW)) {
-		fprintf(stderr, "ELF contains relo data for non ld64 instruction at offset %u! Compiler bug?!\n",
-			insn_off);
-		return -EINVAL;
-	}
-
-	if (map_idx >= ARRAY_SIZE(ctx->map_fds))
-		return -EINVAL;
-	if (!ctx->map_fds[map_idx])
-		return -EINVAL;
-	if (ctx->maps[map_idx].type == BPF_MAP_TYPE_PROG_ARRAY) {
-		props->tc.total++;
-		if (ctx->maps_ext[map_idx].owner.jited ||
-		    (ctx->maps_ext[map_idx].owner.type == 0 &&
-		     ctx->cfg.jit_enabled))
-			props->tc.jited++;
-	}
-
-	prog->insns[insn_off].src_reg = BPF_PSEUDO_MAP_FD;
-	prog->insns[insn_off].imm = ctx->map_fds[map_idx];
-	return 0;
-}
-
-static int bpf_apply_relo_call(struct bpf_elf_ctx *ctx, struct bpf_elf_prog *prog,
-			       GElf_Rel *relo, GElf_Sym *sym,
-			       struct bpf_relo_props *props)
-{
-	unsigned int insn_off = relo->r_offset / sizeof(struct bpf_insn);
-	struct bpf_elf_prog *prog_text = &ctx->prog_text;
-
-	if (insn_off >= prog->insns_num)
-		return -EINVAL;
-	if (prog->insns[insn_off].code != (BPF_JMP | BPF_CALL) &&
-	    prog->insns[insn_off].src_reg != BPF_PSEUDO_CALL) {
-		fprintf(stderr, "ELF contains relo data for non call instruction at offset %u! Compiler bug?!\n",
-			insn_off);
-		return -EINVAL;
-	}
-
-	if (!props->main_num) {
-		struct bpf_insn *insns = realloc(prog->insns,
-						 prog->size + prog_text->size);
-		if (!insns)
-			return -ENOMEM;
-
-		memcpy(insns + prog->insns_num, prog_text->insns,
-		       prog_text->size);
-		props->main_num = prog->insns_num;
-		prog->insns = insns;
-		prog->insns_num += prog_text->insns_num;
-		prog->size += prog_text->size;
-	}
-
-	prog->insns[insn_off].imm += props->main_num - insn_off;
-	return 0;
-}
-
-static int bpf_apply_relo_data(struct bpf_elf_ctx *ctx,
-			       struct bpf_elf_sec_data *data_relo,
-			       struct bpf_elf_prog *prog,
-			       struct bpf_relo_props *props)
-{
-	GElf_Shdr *rhdr = &data_relo->sec_hdr;
-	int relo_ent, relo_num = rhdr->sh_size / rhdr->sh_entsize;
-
-	for (relo_ent = 0; relo_ent < relo_num; relo_ent++) {
-		GElf_Rel relo;
-		GElf_Sym sym;
-		int ret = -EIO;
-
-		if (gelf_getrel(data_relo->sec_data, relo_ent, &relo) != &relo)
-			return -EIO;
-		if (gelf_getsym(ctx->sym_tab, GELF_R_SYM(relo.r_info), &sym) != &sym)
-			return -EIO;
-
-		if (sym.st_shndx == ctx->sec_maps)
-			ret = bpf_apply_relo_map(ctx, prog, &relo, &sym, props);
-		else if (sym.st_shndx == ctx->sec_text)
-			ret = bpf_apply_relo_call(ctx, prog, &relo, &sym, props);
-		else
-			fprintf(stderr, "ELF contains non-{map,call} related relo data in entry %u pointing to section %u! Compiler bug?!\n",
-				relo_ent, sym.st_shndx);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int bpf_fetch_prog_relo(struct bpf_elf_ctx *ctx, const char *section,
-			       bool *lderr, bool *sseen, struct bpf_elf_prog *prog)
-{
-	struct bpf_elf_sec_data data_relo, data_insn;
-	int ret, idx, i, fd = -1;
-
-	for (i = 1; i < ctx->elf_hdr.e_shnum; i++) {
-		struct bpf_relo_props props = {};
-
-		ret = bpf_fill_section_data(ctx, i, &data_relo);
-		if (ret < 0 || data_relo.sec_hdr.sh_type != SHT_REL)
-			continue;
-
-		idx = data_relo.sec_hdr.sh_info;
-
-		ret = bpf_fill_section_data(ctx, idx, &data_insn);
-		if (ret < 0 ||
-		    !(data_insn.sec_hdr.sh_type == SHT_PROGBITS &&
-		      (data_insn.sec_hdr.sh_flags & SHF_EXECINSTR) &&
-		      !strcmp(data_insn.sec_name, section)))
-			continue;
-		if (sseen)
-			*sseen = true;
-
-		memset(prog, 0, sizeof(*prog));
-		prog->type = ctx->type;
-		prog->license = ctx->license;
-		prog->size = data_insn.sec_data->d_size;
-		prog->insns_num = prog->size / sizeof(struct bpf_insn);
-		prog->insns = malloc(prog->size);
-		if (!prog->insns) {
-			*lderr = true;
-			return -ENOMEM;
-		}
-
-		memcpy(prog->insns, data_insn.sec_data->d_buf, prog->size);
-
-		ret = bpf_apply_relo_data(ctx, &data_relo, prog, &props);
-		if (ret < 0) {
-			*lderr = true;
-			if (ctx->sec_text != idx)
-				free(prog->insns);
-			return ret;
-		}
-		if (ctx->sec_text == idx) {
-			fd = 0;
-			goto out;
-		}
-
-		fd = bpf_prog_attach(section, prog, ctx);
-		free(prog->insns);
-		if (fd < 0) {
-			*lderr = true;
-			if (props.tc.total) {
-				if (ctx->cfg.jit_enabled &&
-				    props.tc.total != props.tc.jited)
-					fprintf(stderr, "JIT enabled, but only %u/%u tail call maps in the program have JITed owner!\n",
-						props.tc.jited, props.tc.total);
-				if (!ctx->cfg.jit_enabled &&
-				    props.tc.jited)
-					fprintf(stderr, "JIT disabled, but %u/%u tail call maps in the program have JITed owner!\n",
-						props.tc.jited, props.tc.total);
-			}
-			return fd;
-		}
-out:
-		ctx->sec_done[i]   = true;
-		ctx->sec_done[idx] = true;
-		break;
-	}
-
-	return fd;
-}
-
-static int bpf_fetch_prog_sec(struct bpf_elf_ctx *ctx, const char *section)
-{
-	bool lderr = false, sseen = false;
-	struct bpf_elf_prog prog;
-	int ret = -1;
-
-	if (bpf_has_call_data(ctx)) {
-		ret = bpf_fetch_prog_relo(ctx, ".text", &lderr, NULL,
-					  &ctx->prog_text);
-		if (ret < 0)
-			return ret;
-	}
-
-	if (bpf_has_map_data(ctx) || bpf_has_call_data(ctx))
-		ret = bpf_fetch_prog_relo(ctx, section, &lderr, &sseen, &prog);
-	if (ret < 0 && !lderr)
-		ret = bpf_fetch_prog(ctx, section, &sseen);
-	if (ret < 0 && !sseen)
-		fprintf(stderr, "Program section \'%s\' not found in ELF file!\n",
-			section);
-	return ret;
-}
-
-static int bpf_find_map_by_id(struct bpf_elf_ctx *ctx, uint32_t id)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->map_fds); i++)
-		if (ctx->map_fds[i] && ctx->maps[i].id == id &&
-		    ctx->maps[i].type == BPF_MAP_TYPE_PROG_ARRAY)
-			return i;
-	return -1;
-}
-
-struct bpf_jited_aux {
-	int prog_fd;
-	int map_fd;
-	struct bpf_prog_data prog;
-	struct bpf_map_ext map;
-};
-
-static int bpf_derive_prog_from_fdinfo(int fd, struct bpf_prog_data *prog)
-{
-	char file[PATH_MAX], buff[4096];
-	unsigned int val;
-	FILE *fp;
-
-	snprintf(file, sizeof(file), "/proc/%d/fdinfo/%d", getpid(), fd);
-	memset(prog, 0, sizeof(*prog));
-
-	fp = fopen(file, "r");
-	if (!fp) {
-		fprintf(stderr, "No procfs support?!\n");
-		return -EIO;
-	}
-
-	while (fgets(buff, sizeof(buff), fp)) {
-		if (sscanf(buff, "prog_type:\t%u", &val) == 1)
-			prog->type = val;
-		else if (sscanf(buff, "prog_jited:\t%u", &val) == 1)
-			prog->jited = val;
-	}
-
-	fclose(fp);
-	return 0;
-}
-
-static int bpf_tail_call_get_aux(struct bpf_jited_aux *aux)
-{
-	struct bpf_elf_map tmp;
-	int ret;
-
-	ret = bpf_derive_elf_map_from_fdinfo(aux->map_fd, &tmp, &aux->map);
-	if (!ret)
-		ret = bpf_derive_prog_from_fdinfo(aux->prog_fd, &aux->prog);
-
-	return ret;
-}
-
-static int bpf_fill_prog_arrays(struct bpf_elf_ctx *ctx)
-{
-	struct bpf_elf_sec_data data;
-	uint32_t map_id, key_id;
-	int fd, i, ret, idx;
-
-	for (i = 1; i < ctx->elf_hdr.e_shnum; i++) {
-		if (ctx->sec_done[i])
-			continue;
-
-		ret = bpf_fill_section_data(ctx, i, &data);
-		if (ret < 0)
-			continue;
-
-		ret = sscanf(data.sec_name, "%i/%i", &map_id, &key_id);
-		if (ret != 2)
-			continue;
-
-		idx = bpf_find_map_by_id(ctx, map_id);
-		if (idx < 0)
-			continue;
-
-		fd = bpf_fetch_prog_sec(ctx, data.sec_name);
-		if (fd < 0)
-			return -EIO;
-
-		ret = bpf_map_update(ctx->map_fds[idx], &key_id,
-				     &fd, BPF_ANY);
-		if (ret < 0) {
-			struct bpf_jited_aux aux = {};
-
-			ret = -errno;
-			if (errno == E2BIG) {
-				fprintf(stderr, "Tail call key %u for map %u out of bounds?\n",
-					key_id, map_id);
-				return ret;
-			}
-
-			aux.map_fd  = ctx->map_fds[idx];
-			aux.prog_fd = fd;
-
-			if (bpf_tail_call_get_aux(&aux))
-				return ret;
-			if (!aux.map.owner.type)
-				return ret;
-
-			if (aux.prog.type != aux.map.owner.type)
-				fprintf(stderr, "Tail call map owned by prog type %u, but prog type is %u!\n",
-					aux.map.owner.type, aux.prog.type);
-			if (aux.prog.jited != aux.map.owner.jited)
-				fprintf(stderr, "Tail call map %s jited, but prog %s!\n",
-					aux.map.owner.jited ? "is" : "not",
-					aux.prog.jited ? "is" : "not");
-			return ret;
-		}
-
-		ctx->sec_done[i] = true;
-	}
-
-	return 0;
-}
-
-static int bpf_read_pin_mapping(FILE *fp, uint32_t *id, char *path)
-{
-	char buff[PATH_MAX];
-
-	while (fgets(buff, sizeof(buff), fp)) {
-		char *ptr = buff;
-
-		while (*ptr == ' ' || *ptr == '\t')
-			ptr++;
-
-		if (*ptr == '#' || *ptr == '\n' || *ptr == 0)
-			continue;
-
-		if (sscanf(ptr, "%i %s\n", id, path) != 2 &&
-		    sscanf(ptr, "%i %s #", id, path) != 2) {
-			strcpy(path, ptr);
-			return -1;
-		}
-
-		return 1;
-	}
-
-	return 0;
-}
-
-static bool bpf_pinning_reserved(uint32_t pinning)
-{
-	switch (pinning) {
-	case PIN_NONE:
-	case PIN_OBJECT_NS:
-	case PIN_GLOBAL_NS:
-		return true;
-	default:
-		return false;
-	}
-}
-
-static int bpf_hash_init(struct bpf_elf_ctx *ctx, const char *db_file)
-{
-	struct bpf_hash_entry *entry;
-	char subpath[PATH_MAX] = {};
-	uint32_t pinning;
-	FILE *fp;
-	int ret;
-
-	fp = fopen(db_file, "r");
-	if (!fp)
-		return -errno;
-
-	while ((ret = bpf_read_pin_mapping(fp, &pinning, subpath))) {
-		if (ret == -1) {
-			fprintf(stderr, "Database %s is corrupted at: %s\n",
-				db_file, subpath);
-			fclose(fp);
-			return -EINVAL;
-		}
-
-		if (bpf_pinning_reserved(pinning)) {
-			fprintf(stderr, "Database %s, id %u is reserved - ignoring!\n",
-				db_file, pinning);
-			continue;
-		}
-
-		entry = malloc(sizeof(*entry));
-		if (!entry) {
-			fprintf(stderr, "No memory left for db entry!\n");
-			continue;
-		}
-
-		entry->pinning = pinning;
-		entry->subpath = strdup(subpath);
-		if (!entry->subpath) {
-			fprintf(stderr, "No memory left for db entry!\n");
-			free(entry);
-			continue;
-		}
-
-		entry->next = ctx->ht[pinning & (ARRAY_SIZE(ctx->ht) - 1)];
-		ctx->ht[pinning & (ARRAY_SIZE(ctx->ht) - 1)] = entry;
-	}
-
-	fclose(fp);
-
-	return 0;
-}
-
-static void bpf_hash_destroy(struct bpf_elf_ctx *ctx)
-{
-	struct bpf_hash_entry *entry;
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->ht); i++) {
-		while ((entry = ctx->ht[i]) != NULL) {
-			ctx->ht[i] = entry->next;
-			free((char *)entry->subpath);
-			free(entry);
-		}
-	}
-}
-
-static int bpf_elf_check_ehdr(const struct bpf_elf_ctx *ctx)
-{
-	if (ctx->elf_hdr.e_type != ET_REL ||
-	    (ctx->elf_hdr.e_machine != EM_NONE &&
-	     ctx->elf_hdr.e_machine != EM_BPF) ||
-	    ctx->elf_hdr.e_version != EV_CURRENT) {
-		fprintf(stderr, "ELF format error, ELF file not for eBPF?\n");
-		return -EINVAL;
-	}
-
-	switch (ctx->elf_hdr.e_ident[EI_DATA]) {
-	default:
-		fprintf(stderr, "ELF format error, wrong endianness info?\n");
-		return -EINVAL;
-	case ELFDATA2LSB:
-		if (htons(1) == 1) {
-			fprintf(stderr,
-				"We are big endian, eBPF object is little endian!\n");
-			return -EIO;
-		}
-		break;
-	case ELFDATA2MSB:
-		if (htons(1) != 1) {
-			fprintf(stderr,
-				"We are little endian, eBPF object is big endian!\n");
-			return -EIO;
-		}
-		break;
-	}
-
-	return 0;
-}
-
-static void bpf_get_cfg(struct bpf_elf_ctx *ctx)
-{
-	static const char *path_jit = "/proc/sys/net/core/bpf_jit_enable";
-	int fd;
-
-	fd = open(path_jit, O_RDONLY);
-	if (fd >= 0) {
-		char tmp[16] = {};
-
-		if (read(fd, tmp, sizeof(tmp)) > 0)
-			ctx->cfg.jit_enabled = atoi(tmp);
-		close(fd);
-	}
-}
-
-static int bpf_elf_ctx_init(struct bpf_elf_ctx *ctx, const char *pathname,
-			    enum bpf_prog_type type, __u32 ifindex,
-			    bool verbose)
-{
-	__u8 tmp[SHA1_DIGEST_SIZE];
-	int ret;
-
-	if (elf_version(EV_CURRENT) == EV_NONE)
-		return -EINVAL;
-
-	bpf_init_env();
-
-	memset(ctx, 0, sizeof(*ctx));
-	bpf_get_cfg(ctx);
-
-	ctx->verbose = verbose;
-	ctx->type    = type;
-	ctx->ifindex = ifindex;
-
-	ctx->obj_fd = open(pathname, O_RDONLY);
-	if (ctx->obj_fd < 0) {
-		fprintf(stderr, "Error opening object %s: %s\n", pathname,
-			strerror(errno));
-		return ctx->obj_fd;
-	}
-
-	ret = bpf_obj_hash(ctx->obj_fd, pathname, tmp);
-	if (ret)
-		goto out_fd;
-	hexstring_n2a(tmp, sizeof(tmp), ctx->obj_uid, sizeof(ctx->obj_uid));
-
-	ctx->elf_fd = elf_begin(ctx->obj_fd, ELF_C_READ, NULL);
-	if (!ctx->elf_fd) {
-		ret = -EINVAL;
-		goto out_fd;
-	}
-
-	if (elf_kind(ctx->elf_fd) != ELF_K_ELF) {
-		ret = -EINVAL;
-		goto out_fd;
-	}
-
-	if (gelf_getehdr(ctx->elf_fd, &ctx->elf_hdr) !=
-	    &ctx->elf_hdr) {
-		ret = -EIO;
-		goto out_elf;
-	}
-
-	ret = bpf_elf_check_ehdr(ctx);
-	if (ret < 0)
-		goto out_elf;
-
-	ctx->sec_done = calloc(ctx->elf_hdr.e_shnum,
-			       sizeof(*(ctx->sec_done)));
-	if (!ctx->sec_done) {
-		ret = -ENOMEM;
-		goto out_elf;
-	}
-
-	if (ctx->verbose && bpf_log_realloc(ctx)) {
-		ret = -ENOMEM;
-		goto out_free;
-	}
-
-	bpf_hash_init(ctx, CONF_ETC_DIR "/bpf_pinning");
-	if (ret == -ENOENT)
-		ret = bpf_hash_init(ctx, CONF_USR_DIR "/bpf_pinning");
-
-	return 0;
-out_free:
-	free(ctx->sec_done);
-out_elf:
-	elf_end(ctx->elf_fd);
-out_fd:
-	close(ctx->obj_fd);
-	return ret;
-}
-
-static void bpf_maps_teardown(struct bpf_elf_ctx *ctx)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->map_fds); i++) {
-		if (ctx->map_fds[i])
-			close(ctx->map_fds[i]);
-	}
-
-	if (ctx->btf_fd)
-		close(ctx->btf_fd);
-	free(ctx->btf.types);
-}
-
-static void bpf_elf_ctx_destroy(struct bpf_elf_ctx *ctx, bool failure)
-{
-	if (failure)
-		bpf_maps_teardown(ctx);
-
-	bpf_hash_destroy(ctx);
-
-	free(ctx->prog_text.insns);
-	free(ctx->sec_done);
-	free(ctx->log);
-
-	elf_end(ctx->elf_fd);
-	close(ctx->obj_fd);
-}
-
-static struct bpf_elf_ctx __ctx;
-
-static int bpf_obj_open(const char *pathname, enum bpf_prog_type type,
-			const char *section, __u32 ifindex, bool verbose)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-	int fd = 0, ret;
-
-	ret = bpf_elf_ctx_init(ctx, pathname, type, ifindex, verbose);
-	if (ret < 0) {
-		fprintf(stderr, "Cannot initialize ELF context!\n");
-		return ret;
-	}
-
-	ret = bpf_fetch_ancillary(ctx, strcmp(section, ".text"));
-	if (ret < 0) {
-		fprintf(stderr, "Error fetching ELF ancillary data!\n");
-		goto out;
-	}
-
-	fd = bpf_fetch_prog_sec(ctx, section);
-	if (fd < 0) {
-		fprintf(stderr, "Error fetching program/map!\n");
-		ret = fd;
-		goto out;
-	}
-
-	ret = bpf_fill_prog_arrays(ctx);
-	if (ret < 0)
-		fprintf(stderr, "Error filling program arrays!\n");
-out:
-	bpf_elf_ctx_destroy(ctx, ret < 0);
-	if (ret < 0) {
-		if (fd >= 0)
-			close(fd);
-		return ret;
-	}
-
-	return fd;
-}
-
-#ifdef HAVE_LIBBPF
-/* The following functions are wrapper functions for libbpf code to be
- * compatible with the legacy format. So all the functions have prefix
- * with iproute2_
- */
-int iproute2_bpf_elf_ctx_init(struct bpf_cfg_in *cfg)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-
-	return bpf_elf_ctx_init(ctx, cfg->object, cfg->type, cfg->ifindex, cfg->verbose);
-}
-
-int iproute2_bpf_fetch_ancillary(void)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-	struct bpf_elf_sec_data data;
-	int i, ret = 0;
-
-	for (i = 1; i < ctx->elf_hdr.e_shnum; i++) {
-		ret = bpf_fill_section_data(ctx, i, &data);
-		if (ret < 0)
-			continue;
-
-		if (data.sec_hdr.sh_type == SHT_PROGBITS &&
-		    !strcmp(data.sec_name, ELF_SECTION_MAPS))
-			ret = bpf_fetch_maps_begin(ctx, i, &data);
-		else if (data.sec_hdr.sh_type == SHT_SYMTAB &&
-			 !strcmp(data.sec_name, ".symtab"))
-			ret = bpf_fetch_symtab(ctx, i, &data);
-		else if (data.sec_hdr.sh_type == SHT_STRTAB &&
-			 !strcmp(data.sec_name, ".strtab"))
-			ret = bpf_fetch_strtab(ctx, i, &data);
-		if (ret < 0) {
-			fprintf(stderr, "Error parsing section %d! Perhaps check with readelf -a?\n",
-				i);
-			return ret;
-		}
-	}
-
-	if (bpf_has_map_data(ctx)) {
-		ret = bpf_fetch_maps_end(ctx);
-		if (ret < 0) {
-			fprintf(stderr, "Error fixing up map structure, incompatible struct bpf_elf_map used?\n");
-			return ret;
-		}
-	}
-
-	return ret;
-}
-
-int iproute2_get_root_path(char *root_path, size_t len)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-	int ret = 0;
-
-	snprintf(root_path, len, "%s/%s",
-		 bpf_get_work_dir(ctx->type), BPF_DIR_GLOBALS);
-
-	ret = mkdir(root_path, S_IRWXU);
-	if (ret && errno != EEXIST) {
-		fprintf(stderr, "mkdir %s failed: %s\n", root_path, strerror(errno));
-		return ret;
-	}
-
-	return 0;
-}
-
-bool iproute2_is_pin_map(const char *libbpf_map_name, char *pathname)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-	const char *map_name, *tmp;
-	unsigned int pinning;
-	int i, ret = 0;
-
-	for (i = 0; i < ctx->map_num; i++) {
-		map_name = bpf_map_fetch_name(ctx, i);
-		if (!map_name) {
-			return false;
-		}
-
-		if (strcmp(libbpf_map_name, map_name))
-			continue;
-
-		pinning = ctx->maps[i].pinning;
-
-		if (bpf_no_pinning(ctx, pinning) || !bpf_get_work_dir(ctx->type))
-			return false;
-
-		if (pinning == PIN_OBJECT_NS)
-			ret = bpf_make_obj_path(ctx);
-		else if ((tmp = bpf_custom_pinning(ctx, pinning)))
-			ret = bpf_make_custom_path(ctx, tmp);
-		if (ret < 0)
-			return false;
-
-		bpf_make_pathname(pathname, PATH_MAX, map_name, ctx, pinning);
-
-		return true;
-	}
-
-	return false;
-}
-
-bool iproute2_is_map_in_map(const char *libbpf_map_name, struct bpf_elf_map *imap,
-			    struct bpf_elf_map *omap, char *omap_name)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-	const char *inner_map_name, *outer_map_name;
-	int i, j;
-
-	for (i = 0; i < ctx->map_num; i++) {
-		inner_map_name = bpf_map_fetch_name(ctx, i);
-		if (!inner_map_name) {
-			return false;
-		}
-
-		if (strcmp(libbpf_map_name, inner_map_name))
-			continue;
-
-		if (!ctx->maps[i].id ||
-		    ctx->maps[i].inner_id)
-			continue;
-
-		*imap = ctx->maps[i];
-
-		for (j = 0; j < ctx->map_num; j++) {
-			if (!bpf_is_map_in_map_type(&ctx->maps[j]))
-				continue;
-			if (ctx->maps[j].inner_id != ctx->maps[i].id)
-				continue;
-
-			*omap = ctx->maps[j];
-			outer_map_name = bpf_map_fetch_name(ctx, j);
-			if (!outer_map_name)
-				return false;
-
-			memcpy(omap_name, outer_map_name, strlen(outer_map_name) + 1);
-
-			return true;
-		}
-	}
-
-	return false;
-}
-
-int iproute2_find_map_name_by_id(unsigned int map_id, char *name)
-{
-	struct bpf_elf_ctx *ctx = &__ctx;
-	const char *map_name;
-	int i, idx = -1;
-
-	for (i = 0; i < ctx->map_num; i++) {
-		if (ctx->maps[i].id == map_id &&
-		    ctx->maps[i].type == BPF_MAP_TYPE_PROG_ARRAY) {
-			idx = i;
-			break;
-		}
-	}
-
-	if (idx < 0)
-		return -1;
-
-	map_name = bpf_map_fetch_name(ctx, idx);
-	if (!map_name)
-		return -1;
-
-	memcpy(name, map_name, strlen(map_name) + 1);
-	return 0;
-}
-#endif /* HAVE_LIBBPF */
-#endif /* HAVE_ELF */
diff --git a/lib/bpf_libbpf.c b/lib/bpf_libbpf.c
index 08692d30..0936f47c 100644
--- a/lib/bpf_libbpf.c
+++ b/lib/bpf_libbpf.c
@@ -15,9 +15,6 @@
 #include <fcntl.h>
 #include <limits.h>
 
-#include <libelf.h>
-#include <gelf.h>
-
 #include <bpf/libbpf.h>
 #include <bpf/bpf.h>
 
@@ -35,220 +32,9 @@ silent_print(enum libbpf_print_level level, const char *format, va_list args)
 	if (level > LIBBPF_WARN)
 		return 0;
 
-	/* Skip warning from bpf_object__init_user_maps() for legacy maps */
-	if (strstr(format, "has unrecognized, non-zero options"))
-		return 0;
-
 	return vfprintf(stderr, format, args);
 }
 
-static const char *get_bpf_program__section_name(const struct bpf_program *prog)
-{
-#ifdef HAVE_LIBBPF_SECTION_NAME
-	return bpf_program__section_name(prog);
-#else
-	return bpf_program__title(prog, false);
-#endif
-}
-
-static int create_map(const char *name, struct bpf_elf_map *map,
-		      __u32 ifindex, int inner_fd)
-{
-	union bpf_attr attr = {};
-
-	attr.map_type = map->type;
-	strlcpy(attr.map_name, name, sizeof(attr.map_name));
-	attr.map_flags = map->flags;
-	attr.key_size = map->size_key;
-	attr.value_size = map->size_value;
-	attr.max_entries = map->max_elem;
-	attr.map_ifindex = ifindex;
-	attr.inner_map_fd = inner_fd;
-
-	return bpf(BPF_MAP_CREATE, &attr, sizeof(attr));
-}
-
-static int create_map_in_map(struct bpf_object *obj, struct bpf_map *map,
-			     struct bpf_elf_map *elf_map, int inner_fd,
-			     bool *reuse_pin_map)
-{
-	char pathname[PATH_MAX];
-	const char *map_name;
-	bool pin_map = false;
-	int map_fd, ret = 0;
-
-	map_name = bpf_map__name(map);
-
-	if (iproute2_is_pin_map(map_name, pathname)) {
-		pin_map = true;
-
-		/* Check if there already has a pinned map */
-		map_fd = bpf_obj_get(pathname);
-		if (map_fd > 0) {
-			if (reuse_pin_map)
-				*reuse_pin_map = true;
-			close(map_fd);
-			return bpf_map__set_pin_path(map, pathname);
-		}
-	}
-
-	map_fd = create_map(map_name, elf_map, bpf_map__ifindex(map), inner_fd);
-	if (map_fd < 0) {
-		fprintf(stderr, "create map %s failed\n", map_name);
-		return map_fd;
-	}
-
-	ret = bpf_map__reuse_fd(map, map_fd);
-	if (ret < 0) {
-		fprintf(stderr, "map %s reuse fd failed\n", map_name);
-		goto err_out;
-	}
-
-	if (pin_map) {
-		ret = bpf_map__set_pin_path(map, pathname);
-		if (ret < 0)
-			goto err_out;
-	}
-
-	return 0;
-err_out:
-	close(map_fd);
-	return ret;
-}
-
-static int
-handle_legacy_map_in_map(struct bpf_object *obj, struct bpf_map *inner_map,
-			 const char *inner_map_name)
-{
-	int inner_fd, outer_fd, inner_idx, ret = 0;
-	struct bpf_elf_map imap, omap;
-	struct bpf_map *outer_map;
-	/* What's the size limit of map name? */
-	char outer_map_name[128];
-	bool reuse_pin_map = false;
-
-	/* Deal with map-in-map */
-	if (iproute2_is_map_in_map(inner_map_name, &imap, &omap, outer_map_name)) {
-		ret = create_map_in_map(obj, inner_map, &imap, -1, NULL);
-		if (ret < 0)
-			return ret;
-
-		inner_fd = bpf_map__fd(inner_map);
-		outer_map = bpf_object__find_map_by_name(obj, outer_map_name);
-		ret = create_map_in_map(obj, outer_map, &omap, inner_fd, &reuse_pin_map);
-		if (ret < 0)
-			return ret;
-
-		if (!reuse_pin_map) {
-			inner_idx = imap.inner_idx;
-			outer_fd = bpf_map__fd(outer_map);
-			ret = bpf_map_update_elem(outer_fd, &inner_idx, &inner_fd, 0);
-			if (ret < 0)
-				fprintf(stderr, "Cannot update inner_idx into outer_map\n");
-		}
-	}
-
-	return ret;
-}
-
-static int find_legacy_tail_calls(struct bpf_program *prog, struct bpf_object *obj,
-				  struct bpf_map **pmap)
-{
-	unsigned int map_id, key_id;
-	const char *sec_name;
-	struct bpf_map *map;
-	char map_name[128];
-	int ret;
-
-	/* Handle iproute2 tail call */
-	sec_name = get_bpf_program__section_name(prog);
-	ret = sscanf(sec_name, "%i/%i", &map_id, &key_id);
-	if (ret != 2)
-		return -1;
-
-	ret = iproute2_find_map_name_by_id(map_id, map_name);
-	if (ret < 0) {
-		fprintf(stderr, "unable to find map id %u for tail call\n", map_id);
-		return ret;
-	}
-
-	map = bpf_object__find_map_by_name(obj, map_name);
-	if (!map)
-		return -1;
-
-	if (pmap)
-		*pmap = map;
-
-	return 0;
-}
-
-static int update_legacy_tail_call_maps(struct bpf_object *obj)
-{
-	int prog_fd, map_fd, ret = 0;
-	unsigned int map_id, key_id;
-	struct bpf_program *prog;
-	const char *sec_name;
-	struct bpf_map *map;
-
-	bpf_object__for_each_program(prog, obj) {
-		/* load_bpf_object has already verified find_legacy_tail_calls
-		 * succeeds when it should
-		 */
-		if (find_legacy_tail_calls(prog, obj, &map) < 0)
-			continue;
-
-		prog_fd = bpf_program__fd(prog);
-		if (prog_fd < 0)
-			continue;
-
-		sec_name = get_bpf_program__section_name(prog);
-		ret = sscanf(sec_name, "%i/%i", &map_id, &key_id);
-		if (ret != 2)
-			continue;
-
-		map_fd = bpf_map__fd(map);
-		ret = bpf_map_update_elem(map_fd, &key_id, &prog_fd, 0);
-		if (ret < 0) {
-			fprintf(stderr, "Cannot update map key for tail call!\n");
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-static int handle_legacy_maps(struct bpf_object *obj)
-{
-	char pathname[PATH_MAX];
-	struct bpf_map *map;
-	const char *map_name;
-	int map_fd, ret = 0;
-
-	bpf_object__for_each_map(map, obj) {
-		map_name = bpf_map__name(map);
-
-		ret = handle_legacy_map_in_map(obj, map, map_name);
-		if (ret)
-			return ret;
-
-		/* If it is a iproute2 legacy pin maps, just set pin path
-		 * and let bpf_object__load() to deal with the map creation.
-		 * We need to ignore map-in-maps which have pinned maps manually
-		 */
-		map_fd = bpf_map__fd(map);
-		if (map_fd < 0 && iproute2_is_pin_map(map_name, pathname)) {
-			ret = bpf_map__set_pin_path(map, pathname);
-			if (ret) {
-				fprintf(stderr, "map '%s': couldn't set pin path.\n", map_name);
-				break;
-			}
-		}
-
-	}
-
-	return ret;
-}
-
 static bool bpf_map_is_offload_neutral(const struct bpf_map *map)
 {
 	return bpf_map__type(map) == BPF_MAP_TYPE_PERF_EVENT_ARRAY;
@@ -267,7 +53,7 @@ static bool find_prog_to_attach(struct bpf_program *prog,
 	if (prog_name)
 		return !strcmp(bpf_program__name(prog), prog_name);
 	else
-		return !strcmp(get_bpf_program__section_name(prog), section);
+		return !strcmp(bpf_program__section_name(prog), section);
 }
 
 static int load_bpf_object(struct bpf_cfg_in *cfg)
@@ -278,7 +64,7 @@ static int load_bpf_object(struct bpf_cfg_in *cfg)
 	struct bpf_map *map;
 	int prog_fd, ret = 0;
 
-	ret = iproute2_get_root_path(root_path, PATH_MAX);
+	ret = iproute2_get_root_path(cfg->type, root_path, PATH_MAX);
 	if (ret)
 		return ret;
 
@@ -287,16 +73,20 @@ static int load_bpf_object(struct bpf_cfg_in *cfg)
 			.pin_root_path = root_path,
 	);
 
-#if (LIBBPF_MAJOR_VERSION > 0) || (LIBBPF_MINOR_VERSION >= 7)
 	open_opts.kernel_log_level = 1;
 	if (cfg->verbose)
 		open_opts.kernel_log_level |= 2;
-#endif
 
 	obj = bpf_object__open_file(cfg->object, &open_opts);
-	if (libbpf_get_error(obj)) {
-		fprintf(stderr, "ERROR: opening BPF object file failed\n");
-		return -ENOENT;
+	if (!obj) {
+		/* Save errno before any stdio call can clobber it. */
+		int err = errno ? -errno : -EINVAL;
+		char buf[128];
+
+		libbpf_strerror(err, buf, sizeof(buf));
+		fprintf(stderr, "ERROR: opening BPF object file '%s' failed: %s\n",
+			cfg->object, buf);
+		return err;
 	}
 
 	bpf_object__for_each_program(p, obj) {
@@ -304,10 +94,8 @@ static int load_bpf_object(struct bpf_cfg_in *cfg)
 							  cfg->section,
 							  cfg->prog_name);
 
-		/* Only load the programs that will either be subsequently
-		 * attached or inserted into a tail call map */
-		if (find_legacy_tail_calls(p, obj, NULL) < 0 &&
-		    !prog_to_attach) {
+		/* Only load the program that will be attached */
+		if (!prog_to_attach) {
 			ret = bpf_program__set_autoload(p, false);
 			if (ret)
 				return -EINVAL;
@@ -334,19 +122,10 @@ static int load_bpf_object(struct bpf_cfg_in *cfg)
 		return -ENOENT;
 	}
 
-	/* Handle iproute2 legacy pin maps and map-in-maps */
-	ret = handle_legacy_maps(obj);
-	if (ret)
-		goto unload_obj;
-
 	ret = bpf_object__load(obj);
 	if (ret)
 		goto unload_obj;
 
-	ret = update_legacy_tail_call_maps(obj);
-	if (ret)
-		goto unload_obj;
-
 	prog_fd = fcntl(bpf_program__fd(prog), F_DUPFD_CLOEXEC, 1);
 	if (prog_fd < 0)
 		ret = -errno;
@@ -369,18 +148,6 @@ int iproute2_load_libbpf(struct bpf_cfg_in *cfg)
 	else
 		libbpf_set_print(silent_print);
 
-	ret = iproute2_bpf_elf_ctx_init(cfg);
-	if (ret < 0) {
-		fprintf(stderr, "Cannot initialize ELF context!\n");
-		return ret;
-	}
-
-	ret = iproute2_bpf_fetch_ancillary();
-	if (ret < 0) {
-		fprintf(stderr, "Error fetching ELF ancillary data!\n");
-		return ret;
-	}
-
 	ret = load_bpf_object(cfg);
 	if (ret)
 		return ret;
diff --git a/lib/bpf_util.c b/lib/bpf_util.c
new file mode 100644
index 00000000..e58e54be
--- /dev/null
+++ b/lib/bpf_util.c
@@ -0,0 +1,1093 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * bpf_util.c	BPF common code
+ *
+ * Authors:	Daniel Borkmann <daniel@iogearbox.net>
+ *		Jiri Pirko <jiri@resnulli.us>
+ *		Alexei Starovoitov <ast@kernel.org>
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <assert.h>
+#include <libgen.h>
+
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/vfs.h>
+#include <sys/mount.h>
+#include <sys/resource.h>
+#include <mntent.h>
+
+#include <arpa/inet.h>
+
+#include "utils.h"
+#include "json_print.h"
+
+#include "bpf_util.h"
+#include "bpf_elf.h"
+
+struct bpf_prog_meta {
+	const char *type;
+	const char *subdir;
+	const char *section;
+};
+
+static const enum bpf_prog_type __bpf_types[] = {
+	BPF_PROG_TYPE_SCHED_CLS,
+	BPF_PROG_TYPE_SCHED_ACT,
+	BPF_PROG_TYPE_XDP,
+	BPF_PROG_TYPE_LWT_IN,
+	BPF_PROG_TYPE_LWT_OUT,
+	BPF_PROG_TYPE_LWT_XMIT,
+};
+
+static const struct bpf_prog_meta __bpf_prog_meta[] = {
+	[BPF_PROG_TYPE_SCHED_CLS] = {
+		.type		= "cls",
+		.subdir		= "tc",
+		.section	= ELF_SECTION_CLASSIFIER,
+	},
+	[BPF_PROG_TYPE_SCHED_ACT] = {
+		.type		= "act",
+		.subdir		= "tc",
+		.section	= ELF_SECTION_ACTION,
+	},
+	[BPF_PROG_TYPE_XDP] = {
+		.type		= "xdp",
+		.subdir		= "xdp",
+		.section	= ELF_SECTION_PROG,
+	},
+	[BPF_PROG_TYPE_LWT_IN] = {
+		.type		= "lwt_in",
+		.subdir		= "ip",
+		.section	= ELF_SECTION_PROG,
+	},
+	[BPF_PROG_TYPE_LWT_OUT] = {
+		.type		= "lwt_out",
+		.subdir		= "ip",
+		.section	= ELF_SECTION_PROG,
+	},
+	[BPF_PROG_TYPE_LWT_XMIT] = {
+		.type		= "lwt_xmit",
+		.subdir		= "ip",
+		.section	= ELF_SECTION_PROG,
+	},
+	[BPF_PROG_TYPE_LWT_SEG6LOCAL] = {
+		.type		= "lwt_seg6local",
+		.subdir		= "ip",
+		.section	= ELF_SECTION_PROG,
+	},
+};
+
+static const char *bpf_prog_to_subdir(enum bpf_prog_type type)
+{
+	assert(type < ARRAY_SIZE(__bpf_prog_meta) &&
+	       __bpf_prog_meta[type].subdir);
+	return __bpf_prog_meta[type].subdir;
+}
+
+const char *bpf_prog_to_default_section(enum bpf_prog_type type)
+{
+	assert(type < ARRAY_SIZE(__bpf_prog_meta) &&
+	       __bpf_prog_meta[type].section);
+	return __bpf_prog_meta[type].section;
+}
+
+static inline __u64 bpf_ptr_to_u64(const void *ptr)
+{
+	return (__u64)(unsigned long)ptr;
+}
+
+static int bpf_map_update(int fd, const void *key, const void *value,
+			  uint64_t flags)
+{
+	union bpf_attr attr = {};
+
+	attr.map_fd = fd;
+	attr.key = bpf_ptr_to_u64(key);
+	attr.value = bpf_ptr_to_u64(value);
+	attr.flags = flags;
+
+	return bpf(BPF_MAP_UPDATE_ELEM, &attr, sizeof(attr));
+}
+
+static int bpf_prog_fd_by_id(uint32_t id)
+{
+	union bpf_attr attr = {};
+
+	attr.prog_id = id;
+
+	return bpf(BPF_PROG_GET_FD_BY_ID, &attr, sizeof(attr));
+}
+
+static int bpf_prog_info_by_fd(int fd, struct bpf_prog_info *info,
+			       uint32_t *info_len)
+{
+	union bpf_attr attr = {};
+	int ret;
+
+	attr.info.bpf_fd = fd;
+	attr.info.info = bpf_ptr_to_u64(info);
+	attr.info.info_len = *info_len;
+
+	*info_len = 0;
+	ret = bpf(BPF_OBJ_GET_INFO_BY_FD, &attr, sizeof(attr));
+	if (!ret)
+		*info_len = attr.info.info_len;
+
+	return ret;
+}
+
+int bpf_dump_prog_info(FILE *f, uint32_t id)
+{
+	struct bpf_prog_info info = {};
+	uint32_t len = sizeof(info);
+	int fd, ret, dump_ok = 0;
+
+	open_json_object("prog");
+	print_uint(PRINT_ANY, "id", "id %u ", id);
+
+	fd = bpf_prog_fd_by_id(id);
+	if (fd < 0)
+		goto out;
+
+	ret = bpf_prog_info_by_fd(fd, &info, &len);
+	if (!ret && len) {
+		int jited = !!info.jited_prog_len;
+
+		print_string(PRINT_ANY, "name", "name %s ", info.name);
+		print_hexstring("tag", "tag %s ",
+				info.tag, sizeof(info.tag));
+		print_uint(PRINT_JSON, "jited", NULL, jited);
+		if (jited && !is_json_context())
+			fprintf(f, "jited ");
+
+		if (show_details) {
+			if (info.load_time) {
+				/* ns since boottime */
+				print_lluint(PRINT_ANY, "load_time",
+					     "load_time %llu ", info.load_time);
+
+				print_luint(PRINT_ANY, "created_by_uid",
+					    "created_by_uid %lu ",
+					    info.created_by_uid);
+			}
+
+			if (info.btf_id)
+				print_luint(PRINT_ANY, "btf_id", "btf_id %lu ",
+					    info.btf_id);
+		}
+
+		dump_ok = 1;
+	}
+
+	close(fd);
+out:
+	close_json_object();
+	return dump_ok;
+}
+
+static int bpf_parse_string(char *arg, bool from_file, __u16 *bpf_len,
+			    char **bpf_string, bool *need_release,
+			    const char separator)
+{
+	char sp;
+
+	if (from_file) {
+		size_t tmp_len, op_len = sizeof("65535 255 255 4294967295,");
+		char *tmp_string, *pos, c_prev = ' ';
+		FILE *fp;
+		int c;
+
+		tmp_len = sizeof("4096,") + BPF_MAXINSNS * op_len;
+		tmp_string = pos = calloc(1, tmp_len);
+		if (tmp_string == NULL)
+			return -ENOMEM;
+
+		fp = fopen(arg, "r");
+		if (fp == NULL) {
+			perror("Cannot fopen");
+			free(tmp_string);
+			return -ENOENT;
+		}
+
+		while ((c = fgetc(fp)) != EOF) {
+			switch (c) {
+			case '\n':
+				if (c_prev != ',')
+					*(pos++) = ',';
+				c_prev = ',';
+				break;
+			case ' ':
+			case '\t':
+				if (c_prev != ' ')
+					*(pos++) = c;
+				c_prev = ' ';
+				break;
+			default:
+				*(pos++) = c;
+				c_prev = c;
+			}
+			if (pos - tmp_string == tmp_len)
+				break;
+		}
+
+		if (!feof(fp)) {
+			free(tmp_string);
+			fclose(fp);
+			return -E2BIG;
+		}
+
+		fclose(fp);
+		*pos = 0;
+
+		*need_release = true;
+		*bpf_string = tmp_string;
+	} else {
+		*need_release = false;
+		*bpf_string = arg;
+	}
+
+	if (sscanf(*bpf_string, "%hu%c", bpf_len, &sp) != 2 ||
+	    sp != separator) {
+		if (*need_release)
+			free(*bpf_string);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int bpf_ops_parse(int argc, char **argv, struct sock_filter *bpf_ops,
+			 bool from_file)
+{
+	char *bpf_string, *token, separator = ',';
+	int ret = 0, i = 0;
+	bool need_release;
+	__u16 bpf_len = 0;
+
+	if (argc < 1)
+		return -EINVAL;
+	if (bpf_parse_string(argv[0], from_file, &bpf_len, &bpf_string,
+			     &need_release, separator))
+		return -EINVAL;
+	if (bpf_len == 0 || bpf_len > BPF_MAXINSNS) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	token = bpf_string;
+	while ((token = strchr(token, separator)) && (++token)[0]) {
+		if (i >= bpf_len) {
+			fprintf(stderr, "Real program length exceeds encoded length parameter!\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		if (sscanf(token, "%hu %hhu %hhu %u,",
+			   &bpf_ops[i].code, &bpf_ops[i].jt,
+			   &bpf_ops[i].jf, &bpf_ops[i].k) != 4) {
+			fprintf(stderr, "Error at instruction %d!\n", i);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		i++;
+	}
+
+	if (i != bpf_len) {
+		fprintf(stderr, "Parsed program length is less than encoded length parameter!\n");
+		ret = -EINVAL;
+		goto out;
+	}
+	ret = bpf_len;
+out:
+	if (need_release)
+		free(bpf_string);
+
+	return ret;
+}
+
+void bpf_print_ops(struct rtattr *bpf_ops, __u16 len)
+{
+	struct sock_filter *ops = RTA_DATA(bpf_ops);
+	int i;
+
+	if (len == 0)
+		return;
+
+	open_json_object("bytecode");
+	print_uint(PRINT_ANY, "length", "bytecode \'%u,", len);
+	open_json_array(PRINT_JSON, "insns");
+
+	for (i = 0; i < len; i++) {
+		open_json_object(NULL);
+		print_hu(PRINT_ANY, "code", "%hu ", ops[i].code);
+		print_hhu(PRINT_ANY, "jt", "%hhu ", ops[i].jt);
+		print_hhu(PRINT_ANY, "jf", "%hhu ", ops[i].jf);
+		if (i == len - 1)
+			print_uint(PRINT_ANY, "k", "%u\'", ops[i].k);
+		else
+			print_uint(PRINT_ANY, "k", "%u,", ops[i].k);
+		close_json_object();
+	}
+
+	close_json_array(PRINT_JSON, NULL);
+	close_json_object();
+}
+
+static void bpf_map_pin_report(const struct bpf_elf_map *pin,
+			       const struct bpf_elf_map *obj)
+{
+	fprintf(stderr, "Map specification differs from pinned file!\n");
+
+	if (obj->type != pin->type)
+		fprintf(stderr, " - Type:         %u (obj) != %u (pin)\n",
+			obj->type, pin->type);
+	if (obj->size_key != pin->size_key)
+		fprintf(stderr, " - Size key:     %u (obj) != %u (pin)\n",
+			obj->size_key, pin->size_key);
+	if (obj->size_value != pin->size_value)
+		fprintf(stderr, " - Size value:   %u (obj) != %u (pin)\n",
+			obj->size_value, pin->size_value);
+	if (obj->max_elem != pin->max_elem)
+		fprintf(stderr, " - Max elems:    %u (obj) != %u (pin)\n",
+			obj->max_elem, pin->max_elem);
+	if (obj->flags != pin->flags)
+		fprintf(stderr, " - Flags:        %#x (obj) != %#x (pin)\n",
+			obj->flags, pin->flags);
+
+	fprintf(stderr, "\n");
+}
+
+struct bpf_prog_data {
+	unsigned int type;
+	unsigned int jited;
+};
+
+struct bpf_map_ext {
+	struct bpf_prog_data owner;
+};
+
+static int bpf_derive_elf_map_from_fdinfo(int fd, struct bpf_elf_map *map,
+					  struct bpf_map_ext *ext)
+{
+	unsigned int val, owner_type = 0, owner_jited = 0;
+	char file[PATH_MAX], buff[4096];
+	FILE *fp;
+
+	snprintf(file, sizeof(file), "/proc/%d/fdinfo/%d", getpid(), fd);
+	memset(map, 0, sizeof(*map));
+
+	fp = fopen(file, "r");
+	if (!fp) {
+		fprintf(stderr, "No procfs support?!\n");
+		return -EIO;
+	}
+
+	while (fgets(buff, sizeof(buff), fp)) {
+		if (sscanf(buff, "map_type:\t%u", &val) == 1)
+			map->type = val;
+		else if (sscanf(buff, "key_size:\t%u", &val) == 1)
+			map->size_key = val;
+		else if (sscanf(buff, "value_size:\t%u", &val) == 1)
+			map->size_value = val;
+		else if (sscanf(buff, "max_entries:\t%u", &val) == 1)
+			map->max_elem = val;
+		else if (sscanf(buff, "map_flags:\t%i", &val) == 1)
+			map->flags = val;
+		else if (sscanf(buff, "owner_prog_type:\t%i", &val) == 1)
+			owner_type = val;
+		else if (sscanf(buff, "owner_jited:\t%i", &val) == 1)
+			owner_jited = val;
+	}
+
+	fclose(fp);
+	if (ext) {
+		memset(ext, 0, sizeof(*ext));
+		ext->owner.type  = owner_type;
+		ext->owner.jited = owner_jited;
+	}
+
+	return 0;
+}
+
+static int bpf_map_selfcheck_pinned(int fd, const struct bpf_elf_map *map,
+				    struct bpf_map_ext *ext, int length,
+				    enum bpf_prog_type type)
+{
+	struct bpf_elf_map tmp, zero = {};
+	int ret;
+
+	ret = bpf_derive_elf_map_from_fdinfo(fd, &tmp, ext);
+	if (ret < 0)
+		return ret;
+
+	/* The decision to reject this is on kernel side eventually, but
+	 * at least give the user a chance to know what's wrong.
+	 */
+	if (ext->owner.type && ext->owner.type != type)
+		fprintf(stderr, "Program array map owner types differ: %u (obj) != %u (pin)\n",
+			type, ext->owner.type);
+
+	if (!memcmp(&tmp, map, length)) {
+		return 0;
+	} else {
+		/* If kernel doesn't have eBPF-related fdinfo, we cannot do much,
+		 * so just accept it. We know we do have an eBPF fd and in this
+		 * case, everything is 0. It is guaranteed that no such map exists
+		 * since map type of 0 is unloadable BPF_MAP_TYPE_UNSPEC.
+		 */
+		if (!memcmp(&tmp, &zero, length))
+			return 0;
+
+		bpf_map_pin_report(&tmp, map);
+		return -EINVAL;
+	}
+}
+
+static int bpf_mnt_fs(const char *target)
+{
+	bool bind_done = false;
+
+	while (mount("", target, "none", MS_PRIVATE | MS_REC, NULL)) {
+		if (errno != EINVAL || bind_done) {
+			fprintf(stderr, "mount --make-private %s failed: %s\n",
+				target,	strerror(errno));
+			return -1;
+		}
+
+		if (mount(target, target, "none", MS_BIND, NULL)) {
+			fprintf(stderr, "mount --bind %s %s failed: %s\n",
+				target,	target, strerror(errno));
+			return -1;
+		}
+
+		bind_done = true;
+	}
+
+	if (mount("bpf", target, "bpf", 0, "mode=0700")) {
+		fprintf(stderr, "mount -t bpf bpf %s failed: %s\n",
+			target,	strerror(errno));
+		return -1;
+	}
+
+	return 0;
+}
+
+static int bpf_mnt_check_target(const char *target)
+{
+	int ret;
+
+	ret = mkdir(target, S_IRWXU);
+	if (ret) {
+		if (errno == EEXIST)
+			return 0;
+		fprintf(stderr, "mkdir %s failed: %s\n", target,
+			strerror(errno));
+	}
+
+	return ret;
+}
+
+static int bpf_valid_mntpt(const char *mnt, unsigned long magic)
+{
+	struct statfs st_fs;
+
+	if (statfs(mnt, &st_fs) < 0)
+		return -ENOENT;
+	if ((unsigned long)st_fs.f_type != magic)
+		return -ENOENT;
+
+	return 0;
+}
+
+static const char *bpf_find_mntpt_single(unsigned long magic, char *mnt,
+					 int len, const char *mntpt)
+{
+	int ret;
+
+	ret = bpf_valid_mntpt(mntpt, magic);
+	if (ret)
+		return NULL;
+
+	if (strlcpy(mnt, mntpt, len) >= (size_t)len)
+		return NULL;
+
+	return mnt;
+}
+
+static const char *bpf_find_mntpt(const char *fstype, unsigned long magic,
+				  char *mnt, int len,
+				  const char * const *known_mnts)
+{
+	const char * const *ptr;
+	const char *found = NULL;
+	struct mntent *ent;
+	FILE *fp;
+
+	if (known_mnts) {
+		ptr = known_mnts;
+		while (*ptr) {
+			if (bpf_find_mntpt_single(magic, mnt, len, *ptr))
+				return mnt;
+			ptr++;
+		}
+	}
+
+	fp = setmntent("/proc/mounts", "r");
+	if (fp == NULL)
+		return NULL;
+
+	while ((ent = getmntent(fp)) != NULL) {
+		if (strcmp(ent->mnt_type, fstype) != 0)
+			continue;
+
+		found = bpf_find_mntpt_single(magic, mnt, len, ent->mnt_dir);
+		if (found)
+			break;
+	}
+
+	endmntent(fp);
+	return found;
+}
+
+int bpf_trace_pipe(void)
+{
+	char tracefs_mnt[PATH_MAX] = TRACE_DIR_MNT;
+	static const char * const tracefs_known_mnts[] = {
+		TRACE_DIR_MNT,
+		"/sys/kernel/debug/tracing",
+		"/tracing",
+		"/trace",
+		0,
+	};
+	int fd_in, fd_out = STDERR_FILENO;
+	char tpipe[PATH_MAX];
+	const char *mnt;
+
+	mnt = bpf_find_mntpt("tracefs", TRACEFS_MAGIC, tracefs_mnt,
+			     sizeof(tracefs_mnt), tracefs_known_mnts);
+	if (!mnt) {
+		fprintf(stderr, "tracefs not mounted?\n");
+		return -1;
+	}
+
+	snprintf(tpipe, sizeof(tpipe), "%s/trace_pipe", mnt);
+
+	fd_in = open(tpipe, O_RDONLY);
+	if (fd_in < 0)
+		return -1;
+
+	fprintf(stderr, "Running! Hang up with ^C!\n\n");
+	while (1) {
+		static char buff[4096];
+		ssize_t ret;
+
+		ret = read(fd_in, buff, sizeof(buff));
+		if (ret > 0 && write(fd_out, buff, ret) == ret)
+			continue;
+		break;
+	}
+
+	close(fd_in);
+	return -1;
+}
+
+static int bpf_gen_global(const char *bpf_sub_dir)
+{
+	char bpf_glo_dir[PATH_MAX];
+	int ret;
+
+	snprintf(bpf_glo_dir, sizeof(bpf_glo_dir), "%s/%s/",
+		 bpf_sub_dir, BPF_DIR_GLOBALS);
+
+	ret = mkdir(bpf_glo_dir, S_IRWXU);
+	if (ret && errno != EEXIST) {
+		fprintf(stderr, "mkdir %s failed: %s\n", bpf_glo_dir,
+			strerror(errno));
+		return ret;
+	}
+
+	return 0;
+}
+
+static int bpf_gen_master(const char *base, const char *name)
+{
+	char bpf_sub_dir[PATH_MAX + NAME_MAX + 1];
+	int ret;
+
+	snprintf(bpf_sub_dir, sizeof(bpf_sub_dir), "%s%s/", base, name);
+
+	ret = mkdir(bpf_sub_dir, S_IRWXU);
+	if (ret && errno != EEXIST) {
+		fprintf(stderr, "mkdir %s failed: %s\n", bpf_sub_dir,
+			strerror(errno));
+		return ret;
+	}
+
+	return bpf_gen_global(bpf_sub_dir);
+}
+
+static int bpf_slave_via_bind_mnt(const char *full_name,
+				  const char *full_link)
+{
+	int ret;
+
+	ret = mkdir(full_name, S_IRWXU);
+	if (ret) {
+		assert(errno != EEXIST);
+		fprintf(stderr, "mkdir %s failed: %s\n", full_name,
+			strerror(errno));
+		return ret;
+	}
+
+	ret = mount(full_link, full_name, "none", MS_BIND, NULL);
+	if (ret) {
+		rmdir(full_name);
+		fprintf(stderr, "mount --bind %s %s failed: %s\n",
+			full_link, full_name, strerror(errno));
+	}
+
+	return ret;
+}
+
+static int bpf_gen_slave(const char *base, const char *name,
+			 const char *link)
+{
+	char bpf_lnk_dir[PATH_MAX + NAME_MAX + 1];
+	char bpf_sub_dir[PATH_MAX + NAME_MAX];
+	struct stat sb = {};
+	int ret;
+
+	snprintf(bpf_lnk_dir, sizeof(bpf_lnk_dir), "%s%s/", base, link);
+	snprintf(bpf_sub_dir, sizeof(bpf_sub_dir), "%s%s",  base, name);
+
+	ret = symlink(bpf_lnk_dir, bpf_sub_dir);
+	if (ret) {
+		if (errno != EEXIST) {
+			if (errno != EPERM) {
+				fprintf(stderr, "symlink %s failed: %s\n",
+					bpf_sub_dir, strerror(errno));
+				return ret;
+			}
+
+			return bpf_slave_via_bind_mnt(bpf_sub_dir,
+						      bpf_lnk_dir);
+		}
+
+		ret = lstat(bpf_sub_dir, &sb);
+		if (ret) {
+			fprintf(stderr, "lstat %s failed: %s\n",
+				bpf_sub_dir, strerror(errno));
+			return ret;
+		}
+
+		if ((sb.st_mode & S_IFMT) != S_IFLNK)
+			return bpf_gen_global(bpf_sub_dir);
+	}
+
+	return 0;
+}
+
+static int bpf_gen_hierarchy(const char *base)
+{
+	int ret, i;
+
+	ret = bpf_gen_master(base, bpf_prog_to_subdir(__bpf_types[0]));
+	for (i = 1; i < ARRAY_SIZE(__bpf_types) && !ret; i++)
+		ret = bpf_gen_slave(base,
+				    bpf_prog_to_subdir(__bpf_types[i]),
+				    bpf_prog_to_subdir(__bpf_types[0]));
+	return ret;
+}
+
+static const char *bpf_get_work_dir(enum bpf_prog_type type)
+{
+	static char bpf_tmp[PATH_MAX] = BPF_DIR_MNT;
+	static char bpf_wrk_dir[PATH_MAX];
+	static const char *mnt;
+	static bool bpf_mnt_cached;
+	const char *mnt_env = getenv(BPF_ENV_MNT);
+	static const char * const bpf_known_mnts[] = {
+		BPF_DIR_MNT,
+		"/bpf",
+		0,
+	};
+	int ret;
+
+	if (bpf_mnt_cached) {
+		const char *out = mnt;
+
+		if (out && type) {
+			snprintf(bpf_tmp, sizeof(bpf_tmp), "%s%s/",
+				 out, bpf_prog_to_subdir(type));
+			out = bpf_tmp;
+		}
+		return out;
+	}
+
+	if (mnt_env)
+		mnt = bpf_find_mntpt_single(BPF_FS_MAGIC, bpf_tmp,
+					    sizeof(bpf_tmp), mnt_env);
+	else
+		mnt = bpf_find_mntpt("bpf", BPF_FS_MAGIC, bpf_tmp,
+				     sizeof(bpf_tmp), bpf_known_mnts);
+	if (!mnt) {
+		mnt = mnt_env ? : BPF_DIR_MNT;
+		ret = bpf_mnt_check_target(mnt);
+		if (!ret)
+			ret = bpf_mnt_fs(mnt);
+		if (ret) {
+			mnt = NULL;
+			goto out;
+		}
+	}
+
+	ret = snprintf(bpf_wrk_dir, sizeof(bpf_wrk_dir), "%s/", mnt);
+	if (ret < 0 || ret >= sizeof(bpf_wrk_dir)) {
+		mnt = NULL;
+		goto out;
+	}
+
+	ret = bpf_gen_hierarchy(bpf_wrk_dir);
+	if (ret) {
+		mnt = NULL;
+		goto out;
+	}
+
+	mnt = bpf_wrk_dir;
+out:
+	bpf_mnt_cached = true;
+	return mnt;
+}
+
+static int bpf_obj_get(const char *pathname, enum bpf_prog_type type)
+{
+	union bpf_attr attr = {};
+	char tmp[PATH_MAX];
+
+	if (strlen(pathname) > 2 && pathname[0] == 'm' &&
+	    pathname[1] == ':' && bpf_get_work_dir(type)) {
+		snprintf(tmp, sizeof(tmp), "%s/%s",
+			 bpf_get_work_dir(type), pathname + 2);
+		pathname = tmp;
+	}
+
+	attr.pathname = bpf_ptr_to_u64(pathname);
+
+	return bpf(BPF_OBJ_GET, &attr, sizeof(attr));
+}
+
+static int bpf_obj_pinned(const char *pathname, enum bpf_prog_type type)
+{
+	int prog_fd = bpf_obj_get(pathname, type);
+
+	if (prog_fd < 0)
+		fprintf(stderr, "Couldn\'t retrieve pinned program \'%s\': %s\n",
+			pathname, strerror(errno));
+	return prog_fd;
+}
+
+static int bpf_do_parse(struct bpf_cfg_in *cfg, const bool *opt_tbl)
+{
+	const char *file, *section, *prog_name;
+	bool verbose = false;
+	int i, ret, argc;
+	char **argv;
+
+	argv = cfg->argv;
+	argc = cfg->argc;
+
+	if (opt_tbl[CBPF_BYTECODE] &&
+	    (matches(*argv, "bytecode") == 0 ||
+	     strcmp(*argv, "bc") == 0)) {
+		cfg->mode = CBPF_BYTECODE;
+	} else if (opt_tbl[CBPF_FILE] &&
+		   (matches(*argv, "bytecode-file") == 0 ||
+		    strcmp(*argv, "bcf") == 0)) {
+		cfg->mode = CBPF_FILE;
+	} else if (opt_tbl[EBPF_OBJECT] &&
+		   (matches(*argv, "object-file") == 0 ||
+		    strcmp(*argv, "obj") == 0)) {
+		cfg->mode = EBPF_OBJECT;
+	} else if (opt_tbl[EBPF_PINNED] &&
+		   (matches(*argv, "object-pinned") == 0 ||
+		    matches(*argv, "pinned") == 0 ||
+		    matches(*argv, "fd") == 0)) {
+		cfg->mode = EBPF_PINNED;
+	} else {
+		fprintf(stderr, "What mode is \"%s\"?\n", *argv);
+		return -1;
+	}
+
+	NEXT_ARG();
+	file = section = prog_name = NULL;
+	if (cfg->mode == EBPF_OBJECT || cfg->mode == EBPF_PINNED) {
+		file = *argv;
+		NEXT_ARG_FWD();
+
+		if (cfg->type == BPF_PROG_TYPE_UNSPEC) {
+			if (argc > 0 && matches(*argv, "type") == 0) {
+				NEXT_ARG();
+				for (i = 0; i < ARRAY_SIZE(__bpf_prog_meta);
+				     i++) {
+					if (!__bpf_prog_meta[i].type)
+						continue;
+					if (!matches(*argv,
+						     __bpf_prog_meta[i].type)) {
+						cfg->type = i;
+						break;
+					}
+				}
+
+				if (cfg->type == BPF_PROG_TYPE_UNSPEC) {
+					fprintf(stderr, "What type is \"%s\"?\n",
+						*argv);
+					return -1;
+				}
+				NEXT_ARG_FWD();
+			} else {
+				cfg->type = BPF_PROG_TYPE_SCHED_CLS;
+			}
+		}
+
+		section = bpf_prog_to_default_section(cfg->type);
+		if (argc > 0 && matches(*argv, "section") == 0) {
+			NEXT_ARG();
+			section = *argv;
+			NEXT_ARG_FWD();
+		}
+
+		if (argc > 0 && strcmp(*argv, "program") == 0) {
+			NEXT_ARG();
+			prog_name = *argv;
+			NEXT_ARG_FWD();
+		}
+
+		if (argc > 0 && matches(*argv, "verbose") == 0) {
+			verbose = true;
+			NEXT_ARG_FWD();
+		}
+
+		PREV_ARG();
+	}
+
+	if (cfg->mode == CBPF_BYTECODE || cfg->mode == CBPF_FILE) {
+		ret = bpf_ops_parse(argc, argv, cfg->opcodes,
+				    cfg->mode == CBPF_FILE);
+		cfg->n_opcodes = ret;
+	} else if (cfg->mode == EBPF_OBJECT) {
+		ret = 0; /* program will be loaded by load stage */
+	} else if (cfg->mode == EBPF_PINNED) {
+		ret = bpf_obj_pinned(file, cfg->type);
+		cfg->prog_fd = ret;
+	} else {
+		return -1;
+	}
+
+	cfg->object  = file;
+	cfg->section = section;
+	cfg->argc    = argc;
+	cfg->argv    = argv;
+	cfg->verbose = verbose;
+	cfg->prog_name = prog_name;
+
+	return ret;
+}
+
+static int bpf_do_load(struct bpf_cfg_in *cfg)
+{
+	if (cfg->mode == EBPF_OBJECT)
+		return iproute2_load_libbpf(cfg);
+	return 0;
+}
+
+int bpf_load_common(struct bpf_cfg_in *cfg, const struct bpf_cfg_ops *ops,
+		    void *nl)
+{
+	char annotation[256];
+	int ret;
+
+	ret = bpf_do_load(cfg);
+	if (ret < 0)
+		return ret;
+
+	if (cfg->mode == CBPF_BYTECODE || cfg->mode == CBPF_FILE)
+		ops->cbpf_cb(nl, cfg->opcodes, cfg->n_opcodes);
+	if (cfg->mode == EBPF_OBJECT || cfg->mode == EBPF_PINNED) {
+		snprintf(annotation, sizeof(annotation), "%s:[%s]",
+			 basename(strdupa(cfg->object)),
+			 cfg->mode == EBPF_PINNED ? "*fsobj" : cfg->section);
+		ops->ebpf_cb(nl, cfg->prog_fd, annotation);
+	}
+
+	return 0;
+}
+
+int bpf_parse_common(struct bpf_cfg_in *cfg, const struct bpf_cfg_ops *ops)
+{
+	bool opt_tbl[BPF_MODE_MAX] = {};
+
+	if (ops->cbpf_cb) {
+		opt_tbl[CBPF_BYTECODE] = true;
+		opt_tbl[CBPF_FILE]     = true;
+	}
+
+	if (ops->ebpf_cb) {
+		opt_tbl[EBPF_OBJECT]   = true;
+		opt_tbl[EBPF_PINNED]   = true;
+	}
+
+	return bpf_do_parse(cfg, opt_tbl);
+}
+
+int bpf_parse_and_load_common(struct bpf_cfg_in *cfg,
+			      const struct bpf_cfg_ops *ops, void *nl)
+{
+	int ret;
+
+	ret = bpf_parse_common(cfg, ops);
+	if (ret < 0)
+		return ret;
+
+	return bpf_load_common(cfg, ops, nl);
+}
+
+int bpf_graft_map(const char *map_path, uint32_t *key, int argc, char **argv)
+{
+	const bool opt_tbl[BPF_MODE_MAX] = {
+		[EBPF_OBJECT]	= true,
+		[EBPF_PINNED]	= true,
+	};
+	const struct bpf_elf_map test = {
+		.type		= BPF_MAP_TYPE_PROG_ARRAY,
+		.size_key	= sizeof(int),
+		.size_value	= sizeof(int),
+	};
+	struct bpf_cfg_in cfg = {
+		.type		= BPF_PROG_TYPE_UNSPEC,
+		.argc		= argc,
+		.argv		= argv,
+	};
+	struct bpf_map_ext ext = {};
+	int ret, prog_fd, map_fd;
+	uint32_t map_key;
+
+	ret = bpf_do_parse(&cfg, opt_tbl);
+	if (ret < 0)
+		return ret;
+
+	ret = bpf_do_load(&cfg);
+	if (ret < 0)
+		return ret;
+
+	prog_fd = cfg.prog_fd;
+
+	if (key) {
+		map_key = *key;
+	} else {
+		ret = sscanf(cfg.section, "%*i/%i", &map_key);
+		if (ret != 1) {
+			fprintf(stderr, "Couldn\'t infer map key from section name! Please provide \'key\' argument!\n");
+			ret = -EINVAL;
+			goto out_prog;
+		}
+	}
+
+	map_fd = bpf_obj_get(map_path, cfg.type);
+	if (map_fd < 0) {
+		fprintf(stderr, "Couldn\'t retrieve pinned map \'%s\': %s\n",
+			map_path, strerror(errno));
+		ret = map_fd;
+		goto out_prog;
+	}
+
+	ret = bpf_map_selfcheck_pinned(map_fd, &test, &ext,
+				       offsetof(struct bpf_elf_map, max_elem),
+				       cfg.type);
+	if (ret < 0) {
+		fprintf(stderr, "Map \'%s\' self-check failed!\n", map_path);
+		goto out_map;
+	}
+
+	ret = bpf_map_update(map_fd, &map_key, &prog_fd, BPF_ANY);
+	if (ret < 0)
+		fprintf(stderr, "Map update failed: %s\n", strerror(errno));
+out_map:
+	close(map_fd);
+out_prog:
+	close(prog_fd);
+	return ret;
+}
+
+int bpf_prog_load_dev(enum bpf_prog_type type, const struct bpf_insn *insns,
+		      size_t size_insns, const char *license, __u32 ifindex,
+		      char *log, size_t size_log, bool verbose)
+{
+	union bpf_attr attr = {};
+
+	attr.prog_type = type;
+	attr.insns = bpf_ptr_to_u64(insns);
+	attr.insn_cnt = size_insns / sizeof(struct bpf_insn);
+	attr.license = bpf_ptr_to_u64(license);
+	attr.prog_ifindex = ifindex;
+
+	if (size_log > 0) {
+		attr.log_buf = bpf_ptr_to_u64(log);
+		attr.log_size = size_log;
+		attr.log_level = 1;
+		if (verbose)
+			attr.log_level |= 2;
+	}
+
+	return bpf(BPF_PROG_LOAD, &attr, sizeof(attr));
+}
+
+int bpf_program_load(enum bpf_prog_type type, const struct bpf_insn *insns,
+		     size_t size_insns, const char *license, char *log,
+		     size_t size_log, bool verbose)
+{
+	return bpf_prog_load_dev(type, insns, size_insns, license, 0, log, size_log, verbose);
+}
+
+static void bpf_init_env(void)
+{
+	struct rlimit limit = {
+		.rlim_cur = RLIM_INFINITY,
+		.rlim_max = RLIM_INFINITY,
+	};
+
+	/* Don't bother in case we fail! */
+	setrlimit(RLIMIT_MEMLOCK, &limit);
+
+	if (!bpf_get_work_dir(BPF_PROG_TYPE_UNSPEC))
+		fprintf(stderr, "Continuing without mounted eBPF fs. Too old kernel?\n");
+}
+
+int iproute2_get_root_path(enum bpf_prog_type type, char *root_path,
+			   size_t len)
+{
+	int ret;
+
+	bpf_init_env();
+
+	snprintf(root_path, len, "%s/%s",
+		 bpf_get_work_dir(type), BPF_DIR_GLOBALS);
+
+	ret = mkdir(root_path, S_IRWXU);
+	if (ret && errno != EEXIST) {
+		fprintf(stderr, "mkdir %s failed: %s\n", root_path, strerror(errno));
+		return ret;
+	}
+
+	return 0;
+}
diff --git a/lib/sha1.c b/lib/sha1.c
deleted file mode 100644
index 1aa8fd83..00000000
--- a/lib/sha1.c
+++ /dev/null
@@ -1,108 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SHA-1 message digest algorithm
- *
- * Copyright 2025 Google LLC
- */
-
-#include <arpa/inet.h>
-#include <string.h>
-
-#include "sha1.h"
-#include "utils.h"
-
-static const __u32 sha1_K[4] = { 0x5A827999, 0x6ED9EBA1, 0x8F1BBCDC,
-				 0xCA62C1D6 };
-
-static inline __u32 rol32(__u32 v, int bits)
-{
-	return (v << bits) | (v >> (32 - bits));
-}
-
-#define round_up(a, b) (((a) + (b) - 1) & ~((b) - 1))
-
-#define SHA1_ROUND(i, a, b, c, d, e)                                           \
-	do {                                                                   \
-		if ((i) >= 16)                                                 \
-			w[i] = rol32(w[(i) - 16] ^ w[(i) - 14] ^ w[(i) - 8] ^  \
-					     w[(i) - 3],                       \
-				     1);                                       \
-		e += w[i] + rol32(a, 5) + sha1_K[(i) / 20];                    \
-		if ((i) < 20)                                                  \
-			e += (b & (c ^ d)) ^ d;                                \
-		else if ((i) < 40 || (i) >= 60)                                \
-			e += b ^ c ^ d;                                        \
-		else                                                           \
-			e += (c & d) ^ (b & (c ^ d));                          \
-		b = rol32(b, 30);                                              \
-		/* The new (a, b, c, d, e) is the old (e, a, b, c, d). */      \
-	} while (0)
-
-#define SHA1_5ROUNDS(i)                                                        \
-	do {                                                                   \
-		SHA1_ROUND((i) + 0, a, b, c, d, e);                            \
-		SHA1_ROUND((i) + 1, e, a, b, c, d);                            \
-		SHA1_ROUND((i) + 2, d, e, a, b, c);                            \
-		SHA1_ROUND((i) + 3, c, d, e, a, b);                            \
-		SHA1_ROUND((i) + 4, b, c, d, e, a);                            \
-	} while (0)
-
-#define SHA1_20ROUNDS(i)                                                       \
-	do {                                                                   \
-		SHA1_5ROUNDS((i) + 0);                                         \
-		SHA1_5ROUNDS((i) + 5);                                         \
-		SHA1_5ROUNDS((i) + 10);                                        \
-		SHA1_5ROUNDS((i) + 15);                                        \
-	} while (0)
-
-static void sha1_blocks(__u32 h[5], const __u8 *data, size_t nblocks)
-{
-	while (nblocks--) {
-		__u32 a = h[0];
-		__u32 b = h[1];
-		__u32 c = h[2];
-		__u32 d = h[3];
-		__u32 e = h[4];
-		__u32 w[80];
-		int i;
-
-		memcpy(w, data, SHA1_BLOCK_SIZE);
-		for (i = 0; i < 16; i++)
-			w[i] = ntohl(w[i]);
-		SHA1_20ROUNDS(0);
-		SHA1_20ROUNDS(20);
-		SHA1_20ROUNDS(40);
-		SHA1_20ROUNDS(60);
-
-		h[0] += a;
-		h[1] += b;
-		h[2] += c;
-		h[3] += d;
-		h[4] += e;
-		data += SHA1_BLOCK_SIZE;
-	}
-}
-
-/* Calculate the SHA-1 message digest of the given data. */
-void sha1(const __u8 *data, size_t len, __u8 out[SHA1_DIGEST_SIZE])
-{
-	__u32 h[5] = { 0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476,
-		       0xC3D2E1F0 };
-	const __be64 bitcount = htonll((__u64)len * 8);
-	__u8 final_data[2 * SHA1_BLOCK_SIZE] = { 0 };
-	size_t final_len = len % SHA1_BLOCK_SIZE;
-	int i;
-
-	sha1_blocks(h, data, len / SHA1_BLOCK_SIZE);
-
-	memcpy(final_data, data + len - final_len, final_len);
-	final_data[final_len] = 0x80;
-	final_len = round_up(final_len + 9, SHA1_BLOCK_SIZE);
-	memcpy(&final_data[final_len - 8], &bitcount, 8);
-
-	sha1_blocks(h, final_data, final_len / SHA1_BLOCK_SIZE);
-
-	for (i = 0; i < ARRAY_SIZE(h); i++)
-		h[i] = htonl(h[i]);
-	memcpy(out, h, SHA1_DIGEST_SIZE);
-}
diff --git a/man/man8/ip-link.8.in b/man/man8/ip-link.8.in
index 719781bd..8fd900e6 100644
--- a/man/man8/ip-link.8.in
+++ b/man/man8/ip-link.8.in
@@ -2673,10 +2673,7 @@ option.
 
 .BI program " NAME "
 - Specifies the BPF program name that need to be attached. When the program
-name is specified, the section name parameter will be ignored. This option
-only works when iproute2 build with
-.B libbpf
-support.
+name is specified, the section name parameter will be ignored.
 
 .BI verbose
 - Act in verbose mode. For example, even in case of success, this will
diff --git a/man/man8/tc-bpf.8 b/man/man8/tc-bpf.8
index cd781eea..c361d8a9 100644
--- a/man/man8/tc-bpf.8
+++ b/man/man8/tc-bpf.8
@@ -255,23 +255,13 @@ support, depending which of the two the given architecture supports:
 A given restricted C file can be compiled via LLVM as:
 
 .in +4n
-.B clang -O2 -emit-llvm -c bpf.c -o - | llc -march=bpf -filetype=obj -o bpf.o
+.B clang -O2 -g -target bpf -c bpf.c -o bpf.o
 .in
 
-The compiler invocation might still simplify in future, so for now,
-it's quite handy to alias this construct in one way or another, for
-example:
-.in +4n
-.nf
-.sp
-__bcc() {
-        clang -O2 -emit-llvm -c $1 -o - | \\
-        llc -march=bpf -filetype=obj -o "`basename $1 .c`.o"
-}
-
-alias bcc=__bcc
-.fi
-.in
+The
+.B -g
+option is needed for programs that define maps, since the map
+definitions are described by BTF type information.
 
 A minimal, stand-alone unit, which matches on all traffic with the
 default classid (return code of -1) looks like:
@@ -324,7 +314,7 @@ objdump -h bpf.o
                 CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
 5 action-rand   00000098  0000000000000000  0000000000000000  000008c0  2**3
                 CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
-6 maps          00000030  0000000000000000  0000000000000000  00000958  2**2
+6 .maps         00000028  0000000000000000  0000000000000000  00000958  2**3
                 CONTENTS, ALLOC, LOAD, DATA
 7 license       00000004  0000000000000000  0000000000000000  00000988  2**0
                 CONTENTS, ALLOC, LOAD, DATA
@@ -503,17 +493,15 @@ struct tuple {
         long bytes;
 };
 
-#define BPF_MAP_ID_STATS        1 /* agent's map identifier */
 #define BPF_MAX_MARK            256
 
-struct bpf_elf_map __section("maps") map_stats = {
-        .type           =       BPF_MAP_TYPE_ARRAY,
-        .id             =       BPF_MAP_ID_STATS,
-        .size_key       =       sizeof(uint32_t),
-        .size_value     =       sizeof(struct tuple),
-        .max_elem       =       BPF_MAX_MARK,
-        .pinning        =       PIN_GLOBAL_NS,
-};
+struct {
+        __uint(type, BPF_MAP_TYPE_ARRAY);
+        __type(key, uint32_t);
+        __type(value, struct tuple);
+        __uint(max_entries, BPF_MAX_MARK);
+        __uint(pinning, LIBBPF_PIN_BY_NAME);
+} map_stats __section(".maps");
 
 static inline void cls_update_stats(const struct __sk_buff *skb,
                                     uint32_t mark)
@@ -625,23 +613,13 @@ in both examples was:
 #define likely(x) __builtin_expect(!!(x), 1)
 #define unlikely(x) __builtin_expect(!!(x), 0)
 
+/* BTF map definition, see also bpf/bpf_helpers.h from libbpf */
+#define __uint(name, val) int (*name)[val]
+#define __type(name, val) typeof(val) *name
+
 /* Object pinning settings */
-#define PIN_NONE       0
-#define PIN_OBJECT_NS  1
-#define PIN_GLOBAL_NS  2
-
-/* ELF map definition */
-struct bpf_elf_map {
-    __u32 type;
-    __u32 size_key;
-    __u32 size_value;
-    __u32 max_elem;
-    __u32 flags;
-    __u32 id;
-    __u32 pinning;
-    __u32 inner_id;
-    __u32 inner_idx;
-};
+#define LIBBPF_PIN_NONE     0
+#define LIBBPF_PIN_BY_NAME  1
 
 /* Some used BPF function calls. */
 static int (*bpf_skb_store_bytes)(void *ctx, int off, void *from,
diff --git a/misc/ss.c b/misc/ss.c
index 26520cee..69dc8f04 100644
--- a/misc/ss.c
+++ b/misc/ss.c
@@ -52,26 +52,11 @@
 #include <linux/tls.h>
 #include <linux/mptcp.h>
 
-#ifdef HAVE_LIBBPF
-/* If libbpf is new enough (0.6+), support for pretty-printing BPF socket-local
- * storage is enabled, otherwise we emit a warning and disable it.
- * ENABLE_BPF_SKSTORAGE_SUPPORT is only used to gate the socket-local storage
- * feature, so this wouldn't prevent any feature relying on HAVE_LIBBPF to be
- * usable.
- */
-#define ENABLE_BPF_SKSTORAGE_SUPPORT
-
 #include <bpf/bpf.h>
 #include <bpf/btf.h>
 #include <bpf/libbpf.h>
 #include <linux/btf.h>
 
-#if ((LIBBPF_MAJOR_VERSION == 0) && (LIBBPF_MINOR_VERSION < 6))
-#warning "libbpf version 0.6 or later is required, disabling BPF socket-local storage support"
-#undef ENABLE_BPF_SKSTORAGE_SUPPORT
-#endif
-#endif
-
 #if HAVE_RPC
 #include <rpc/rpc.h>
 #include <rpc/xdr.h>
@@ -3444,8 +3429,6 @@ static void parse_diag_msg(struct nlmsghdr *nlh, struct sockstat *s)
 	memcpy(s->remote.data, r->id.idiag_dst, s->local.bytelen);
 }
 
-#ifdef ENABLE_BPF_SKSTORAGE_SUPPORT
-
 #define MAX_NR_BPF_MAP_ID_OPTS 32
 
 struct btf;
@@ -3755,7 +3738,6 @@ static bool bpf_map_opts_is_enabled(void)
 {
 	return bpf_map_opts.nr_maps || bpf_map_opts.show_all;
 }
-#endif
 
 static int inet_show_sock(struct nlmsghdr *nlh,
 			  struct sockstat *s)
@@ -3863,10 +3845,8 @@ static int inet_show_sock(struct nlmsghdr *nlh,
 	}
 	sctp_ino = s->ino;
 
-#ifdef ENABLE_BPF_SKSTORAGE_SUPPORT
 	if (tb[INET_DIAG_SK_BPF_STORAGES])
 		show_sk_bpf_storages(tb[INET_DIAG_SK_BPF_STORAGES]);
-#endif
 
 	return 0;
 }
@@ -4007,7 +3987,6 @@ static int sockdiag_send(int family, int fd, int protocol, struct filter *f)
 		iovlen += 2;
 	}
 
-#ifdef ENABLE_BPF_SKSTORAGE_SUPPORT
 	if (bpf_map_opts_is_enabled()) {
 		bpf_rta = bpf_map_opts_alloc_rta();
 		if (!bpf_rta) {
@@ -4019,7 +3998,6 @@ static int sockdiag_send(int family, int fd, int protocol, struct filter *f)
 		iov[iovlen++] = (struct iovec){ bpf_rta, bpf_rta->rta_len };
 		req.nlh.nlmsg_len += bpf_rta->rta_len;
 	}
-#endif
 
 	msg = (struct msghdr) {
 		.msg_name = (void *)&nladdr,
@@ -5745,10 +5723,8 @@ static void _usage(FILE *dest)
 "       --tos           show tos and priority information\n"
 "       --cgroup        show cgroup information\n"
 "   -b, --bpf           show bpf filter socket information\n"
-#ifdef ENABLE_BPF_SKSTORAGE_SUPPORT
 "       --bpf-maps      show all BPF socket-local storage maps\n"
 "       --bpf-map-id=MAP-ID    show a BPF socket-local storage map\n"
-#endif
 "   -E, --events        continually display sockets as they are destroyed\n"
 "   -Z, --context       display task SELinux security contexts\n"
 "   -z, --contexts      display task and socket SELinux security contexts\n"
@@ -5922,10 +5898,8 @@ static const struct option long_opts[] = {
 	{ "mptcp", 0, 0, 'M' },
 	{ "oneline", 0, 0, 'O' },
 	{ "inet-sockopt", 0, 0, OPT_INET_SOCKOPT },
-#ifdef ENABLE_BPF_SKSTORAGE_SUPPORT
 	{ "bpf-maps", 0, 0, OPT_BPF_MAPS},
 	{ "bpf-map-id", 1, 0, OPT_BPF_MAP_ID},
-#endif
 	{ 0 }
 
 };
@@ -6131,7 +6105,6 @@ int main(int argc, char *argv[])
 		case OPT_INET_SOCKOPT:
 			show_inet_sockopt = 1;
 			break;
-#ifdef ENABLE_BPF_SKSTORAGE_SUPPORT
 		case OPT_BPF_MAPS:
 			if (bpf_map_opts.nr_maps) {
 				bpf_map_opts_mixed_error();
@@ -6143,7 +6116,6 @@ int main(int argc, char *argv[])
 			if (bpf_map_opts_add_id(optarg))
 				exit(1);
 			break;
-#endif
 		case 'h':
 			help();
 		case '?':
@@ -6281,9 +6253,7 @@ int main(int argc, char *argv[])
 	if (show_processes || show_threads || show_proc_ctx || show_sock_ctx)
 		user_ent_destroy();
 
-#ifdef ENABLE_BPF_SKSTORAGE_SUPPORT
 	bpf_map_opts_destroy();
-#endif
 
 	render();
 
-- 
2.53.0

