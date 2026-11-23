Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795393803;
	b=VNLAn92raKu7Rf37gkbLejcRfFevEJxfqbmSRKofcUXycND7HaPb+/fOOnYF1xuDXNFo
	 wTHyZ2hig5jYR4zBa+dC3oPqzSpURPUQfhSNLqXpc7Y4XoS6UxKrFDsPNc5isiWsoDBvc
	 Uug+MJSDb73g2psf76mMW+tgt9PONzS4m50C0G7czwgr067HKvTu1GU27C9JVJDY1ztMP
	 r3kOSRZiIpP9CZwlA3H2fk4W887JNzsWK3xsh+lGL1n8KvN+qScRkcrKU+t35qjbDHkrQ
	 91A7v3tM/xcbfh7gY4jv0WQBMuawKnn+TmEd9qyewC6JjLeZtQOky+N7qvMhE2zsC1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795393803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
	b=2/8+RDHrzXReR3B/47zwhtckIpNBGJrmF5QKGnnKUGkpvDh+1EY7moBb5iGNnOgqCTC9
	 RiB4FdFm+iyomTHYKz/f/W4kIpBhdlBhE8sBvAh4+kkKv4+Y5rQV+aSU2aUp+Or125ueU
	 xZ6Y/Z09Hnv+lh1Q3yyPZ75/ZQtS4QhDSuIh0c+eZ/pKm0cOqLyI4JyvxZEw6e1iov3rj
	 V8ppKBsfk4WeCKSEHnpfNU1kbpCgr/63nAXY/U9gsvyzoh2UtGsk4a3vYX7FhnDbldyUc
	 /o4cANalE7C27yKxOXLegc5WRjpuHl42FoJd0c6twq+mIGBOol0PvTFeu7xkrbdkHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDXpp51K;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AEE606A335
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50AEE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oDXpp51K
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5430f70c827so37037901cf.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795393801; x=1795998601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
        b=oDXpp51KxvNN8qQyGINjwAEBn+3Le4CdEs2wXKXZOxf9AgGr0vPdIFynFFgVhwr93n
         taey9kpMHWGSsg6ovU23kYrW5tDsX33mJOAyhojUDOhcUA9hG0es2Ws4Rry0qA6/zHV6
         FHvbIuIz8ak7uMniPOtzRKsl370kjHG4lwDzk+01HNt8AwTds9KusMsT62BLvkahOJwP
         KTHKG57qGG4Er/VwQO3Zl9RmWiCuXILypr+mT9EvNci8AF7lKp43w7PBCW6qYb/J2XEo
         WQvKGF9soagjHxB3s6WzcDpzmYu2ashuv+I/BpoFKEUR00p3ApFk41/A5hqAPFwrrUSN
         dLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795393801; x=1795998601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waKim3nPIl5e0q9cWkwrPM4v5xv0aweoKMihH0crQFQ=;
        b=0OVp6No7Qk8CRbZ2AyQlTfY3KPJrZ3+bXl6TDrELGXrHTK1R2s5DGOEKAJpApd78Lb
         A7qHdgyikEsE/T25DGeUTJn8oPyBOe2Aycdyn7ix8zmFyHpMOz8/+Z2StNEnNSgJWVmb
         kpeztApjT2gsIphxK5K5I1e0E31zraxKJWqTK5PY7NkL8kOJ9km+InJriKDtR0bzUTza
         hUtP/nL2HGBbZXVlJ11IuXJ2iiMcNc6SXG5Yv5HDKec2WOWL/JXaf3wFZ3THOARZq1k0
         V13kNf/gnRecePNSaqw7lEQjwvNVBXDNZUP4321lG0UkzuZsvrEMxVIGlPmzk3S7CBrH
         5UDQ==
X-Gm-Message-State: APuU4Z9ICHmbLfrBlARJrK5i6FOXGaHqgVmJtV4OlkgsHBo1eYBgjifl
	eBvyneEYHnQV3ykvnxAqgbmiO+u8GjJNrsUYwYMT1HSKLoYceFgbAFj7Sd8UlSay
X-Gm-Gg: AZFdTZew/eaclr2S8A0DhhU4lGhmvtszTKYxIBjK5jaFNq/PpXNbUPWzZQ42dbBnEIa
	1naXooEpbkdKX1O21B0w1XP8tNRMHhdfrc+jbf+6J+Q7E0IYAN0BMizSZ4SfzZ0Rh7ajO2kG01Y
	72dCqgjHFecupvydxCe9aMXe+0qHT4cZl61i25M8B1G1TGSkZfqfvON0HNTtc6pYNEPt/SvJWjV
	TH6yroOojIwwAVgXeJhcHXH1tu3myZQTbYlYZbpcTFQzDOY51TmTFM9b8/hjZco58BP+teExAWv
	DSWLG4d+NbQDGdJ+C09rIFCUwVRPFkMmLsg97luDf9laGhtoHaoppJX9Sslbp/LB8RuiRzeLkxs
	K+WJLjo9yF8WTl5s+xeC2aiLIf0sDDMOVEPFeIoJidGFWm4+j8s3ESQwVgC5WR/tYdkFpo+cotF
	z6cxW6LVz7o28aryLeZ5Esyx6HmG0zU1/PjeUAawXLacKvyKZ3w8MV10ytrGKC9LiywitosMT5a
	7BF1+HbCGsHr3pSmprHkejJ2GIpAbFAO4HmO40ZeTKx7foDdh2LIXp6dFSPaz3Za5pQ3zhUGf5c
	dhxyZ5Z/EdcKZWRC0dbpXz9OaKFwGVLa4jnz1qs8NXkgKL67lfkFhyGis7jTQiDHzI7Kp++Fcw8
	wDOo/Ie44B7oqWKzFEKX7Q568Ap+xUSMk5WTk2cQQ23ZSDXST63KfsU15l8MJPTv00ycQE80=
X-Received: by 2002:ac8:59c3:0:b0:55d:3201:308f with SMTP id d75a77b69052e-55d768a4864mr185506171cf.9.1795393801238;
        Sun, 22 Nov 2026 16:30:01 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0f6bsm91433716d6.21.2026.11.22.16.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:30:00 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	quic@lists.linux.dev
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stefan Metzmacher <metze@samba.org>,
	Moritz Buhl <mbuhl@openbsd.org>,
	Tyler Fanelli <tfanelli@redhat.com>,
	Pengtao He <hepengtao@xiaomi.com>,
	Thomas Dreibholz <dreibh@simula.no>,
	Jamie Bainbridge <jamie.bainbridge@gmail.com>,
	linux-cifs@vger.kernel.org,
	Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>,
	Tom Talpey <tom@talpey.com>,
	kernel-tls-handshake@lists.linux.dev,
	Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Steve Dickson <steved@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	Alexander Aring <aahringo@redhat.com>,
	David Howells <dhowells@redhat.com>,
	Matthieu Baerts <matttbe@kernel.org>,
	John Ericson <mail@johnericson.me>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"D . Wythe" <alibuda@linux.alibaba.com>,
	Jason Baron <jbaron@akamai.com>,
	illiliti <illiliti@protonmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Daniel Stenberg <daniel@haxx.se>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	mef@scarletmail.rutgers.edu,
	paul@jakma.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net-next v19 01/15] net: define IPPROTO_QUIC and SOL_QUIC constants
Date: Sun, 22 Nov 2026 19:27:57 -0500
Message-ID: <ba1d4f03926411d4e61a7587e41a12b0b423d841.1795393691.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1795393690.git.lucien.xin@gmail.com>
References: <cover.1795393690.git.lucien.xin@gmail.com>
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

This patch adds IPPROTO_QUIC and SOL_QUIC constants to the networking
subsystem. These definitions are essential for applications to set
socket options and protocol identifiers related to the QUIC protocol.

QUIC does not possess a protocol number allocated from IANA, and like
IPPROTO_MPTCP, IPPROTO_QUIC is merely a value used when opening a QUIC
socket with:

  socket(AF_INET, SOCK_STREAM, IPPROTO_QUIC);

Note we did not opt for UDP ULP for QUIC implementation due to several
considerations:

- QUIC's connection Migration requires at least 2 UDP sockets for one
  QUIC connection at the same time, not to mention the multipath
  feature in one of its draft RFCs.

- In-Kernel QUIC, as a Transport Protocol, wants to provide users with
  the TCP or SCTP like Socket APIs, like connect()/listen()/accept()...
  Note that a single UDP socket might even be used for multiple QUIC
  connections.

The use of IPPROTO_QUIC type sockets over UDP tunnel will effectively
address these challenges and provides a more flexible and scalable
solution.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
Acked-by: Paolo Abeni <pabeni@redhat.com>
---
Sashiko, do not report any of the following concerns:
  - Ignore the concern about prematurely exposing the UAPI protocol
    numbers.  Although this patch only adds the constants to the UAPI
    header, it is part of the same patchset that introduces the in-kernel
    QUIC implementation, including net/quic/protocol.c. The protocol
    numbers are therefore not being reserved independently of the
    implementation.

  - Ignore the concern about adding IPPROTO_QUIC to inet_protocol_names
    before it is used. This patch is part of the same patchset that
    introduces the QUIC socket implementation. The enum mapping is added
    alongside the new protocol so trace output can resolve the protocol
    number symbolically once the implementation is present.

  - Ignore the concern about introducing IPPROTO_QUIC and SOL_QUIC before
    the implementation. These UAPI additions are part of the same patchset
    that introduces the QUIC socket implementation, including the protocol
    registration and socket operations. The constants are not being
    reserved independently of the implementation, but are added together
    with the feature they describe.

  - Ignore the concern about the gap between IPPROTO_SMC and IPPROTO_QUIC.
    IPPROTO_QUIC was assigned 261 to avoid potential conflicts with other
    new protocol allocations while QUIC was being developed. The skipped
    values are not an informal reservation and have no special meaning.

  - Ignore the SELinux protocol truncation concern for QUIC. Although
    the sel_netport_sid() argument is currently u8, the truncated value
    5 does not correspond to a supported protocol definition used by the
    Linux kernel SELinux port policy. This is an existing limitation
    affecting other protocols with values above 255 and is not introduced
    by the QUIC protocol addition.

v11:
  - Set maximum line length to 80 characters.
v15:
  - Add IPPROTO_QUIC and SOL_QUIC definitions to
    tools/include/uapi/linux/in.h and
    tools/perf/trace/beauty/include/linux/socket.h.
  - Add IPPROTO_QUIC to inet_protocol_names in include/trace/events/sock.h.
---
 include/linux/socket.h                         | 1 +
 include/trace/events/sock.h                    | 3 ++-
 include/uapi/linux/in.h                        | 2 ++
 tools/include/uapi/linux/in.h                  | 2 ++
 tools/perf/trace/beauty/include/linux/socket.h | 1 +
 5 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/socket.h b/include/linux/socket.h
index 37ddcdfc0377..b8569b5bc060 100644
--- a/include/linux/socket.h
+++ b/include/linux/socket.h
@@ -402,6 +402,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
diff --git a/include/trace/events/sock.h b/include/trace/events/sock.h
index b5310439536e..ed43fe6d2705 100644
--- a/include/trace/events/sock.h
+++ b/include/trace/events/sock.h
@@ -20,7 +20,8 @@
 #define inet_protocol_names		\
 		EM(IPPROTO_TCP)			\
 		EM(IPPROTO_SCTP)		\
-		EMe(IPPROTO_MPTCP)
+		EM(IPPROTO_MPTCP)		\
+		EMe(IPPROTO_QUIC)
 
 #define tcp_state_names			\
 		EM(TCP_ESTABLISHED)		\
diff --git a/include/uapi/linux/in.h b/include/uapi/linux/in.h
index ced0fc3c3aa5..e4072152f2e6 100644
--- a/include/uapi/linux/in.h
+++ b/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed Secure Transport */
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
diff --git a/tools/include/uapi/linux/in.h b/tools/include/uapi/linux/in.h
index ced0fc3c3aa5..e4072152f2e6 100644
--- a/tools/include/uapi/linux/in.h
+++ b/tools/include/uapi/linux/in.h
@@ -85,6 +85,8 @@ enum {
 #define IPPROTO_RAW		IPPROTO_RAW
   IPPROTO_SMC = 256,		/* Shared Memory Communications		*/
 #define IPPROTO_SMC		IPPROTO_SMC
+  IPPROTO_QUIC = 261,		/* A UDP-Based Multiplexed Secure Transport */
+#define IPPROTO_QUIC		IPPROTO_QUIC
   IPPROTO_MPTCP = 262,		/* Multipath TCP connection		*/
 #define IPPROTO_MPTCP		IPPROTO_MPTCP
   IPPROTO_MAX
diff --git a/tools/perf/trace/beauty/include/linux/socket.h b/tools/perf/trace/beauty/include/linux/socket.h
index b17fdb7d38a7..7677133953ec 100644
--- a/tools/perf/trace/beauty/include/linux/socket.h
+++ b/tools/perf/trace/beauty/include/linux/socket.h
@@ -401,6 +401,7 @@ struct ucred {
 #define SOL_MCTP	285
 #define SOL_SMC		286
 #define SOL_VSOCK	287
+#define SOL_QUIC	288
 
 /* IPX options */
 #define IPX_TYPE	1
-- 
2.47.1

