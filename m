Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785789;
	b=kKS2PfsM4DFUCgwK0EBEoic+LPTkPadMWHL47g7eq5IoKHXVC7ggaPyXKJuajCjVUDic
	 bqPYBNJ7ppHn8J7hPHnDfvoPTXceM/dKpgxPG6S+bEvt2LVut9ATer92vKoCcUnojS6Up
	 4RVgoNM0LFgSy9AhUO/rG/twoukNlFh15tixaMSigD1IeNYdvGqJJ7zy8SgnHSF81akkG
	 mPdOnxj7Q1vV/PdtDJZAPNlxoiy1xWKKucjl2Y3STiegQaz6nRhVYPPyd9tz5+q9c8+vF
	 T+5DMcimtMqTTBT3fjgIPHIR82Ee0nbhxj+oFzVIf2UxOiUaX/Ptdhn+oO5QM+sd79A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785789;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:
	 X-Msg-Generator:Content-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=1fOyVmbi8GMwRgnaSTvC0ckI7ZWpz7JtmRQJp/2ONcg=;
	b=che8TK7qIfcumm6uHknRh6w2cBleKywRfnEk4HZlGjb33QVz60wxVj72lVBhflZxB9MK
	 lOINXBSd0Z06IgRHfDduWGlGbfewUpyZ2jHG7NzD6JztjwgWHHBg7kwPnf9rPJM9St+1/
	 7PD5AStJN1scS8casYT4UDmBR9WsA3+cZW2hnZdAc2FT8hw+JZ7z7B1soQrVMoCB1ZOOt
	 QtYTxVvORW85Oj+6cl45HZKcZRESdpgAn1xwhNEvnrt5mKydBwR9f7qQ3aVdGha7/AF5O
	 ePokKvES7ka+9relG+pMBT5dRB5Kq/Ov29ZVgeo5WBYNP7m7TPJua9ns4EJ9Ts1DfCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BjprcmgC;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E09606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BjprcmgC
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261127132305epoutp0157ce660d7c9bab018819828ad7ae28b4~r6aheX1Dx1129311293epoutp01R
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:23:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261127132305epoutp0157ce660d7c9bab018819828ad7ae28b4~r6aheX1Dx1129311293epoutp01R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795785785;
	bh=1fOyVmbi8GMwRgnaSTvC0ckI7ZWpz7JtmRQJp/2ONcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BjprcmgChqgW//zyzhQC5t9hqv99KxjpFCtPxq8X4oEvI8p/pyVmbaTwbdzVwLI5X
	 nAF9wmLYz69k9ZdLpGmswmTj318EgktSGj1fc6Mb39As8QXQ8Ea7ifXhAOUsCBZHgg
	 BXvQj5i7KXTodHS303YmNQ8RZR7+jsON83BBZCD8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20261127132305epcas5p3d81aa8212484a0c992998502f081f0e9~r6ag0VcD_3222332223epcas5p3J;
	Fri, 27 Nov 2026 13:23:05 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.93]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4jbYy02cBHz6B9m6; Fri, 27 Nov
	2026 13:23:04 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20261127132303epcas5p4c8e774f6bce688ebdc0a4b7a29644dde~r6afu-ok80517605176epcas5p4u;
	Fri, 27 Nov 2026 13:23:03 +0000 (GMT)
Received: from ws2030076956.sa.corp.samsungelectronics.net (unknown
	[107.99.235.31]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261127132300epsmtip14fb4eb8422da4093e96ed74aa199658e~r6acLyZeN1042710427epsmtip1Z;
	Fri, 27 Nov 2026 13:22:59 +0000 (GMT)
From: Irlanki Sandeep <irlanki.s@samsung.com>
To: kuniyu@google.com
Cc: alexei.starovoitov@gmail.com, ameryhung@gmail.com, andrii@kernel.org,
	ast@kernel.org, bpf@vger.kernel.org, corbet@lwn.net, cpgs@samsung.com,
	daeil2.hwang@samsung.com, daniel@iogearbox.net, davem@davemloft.net,
	edumazet@google.com, g.pokhra@samsung.com, irlanki.s@samsung.com,
	kuba@kernel.org, linux-kernel@vger.kernel.org, lorenzo@google.com,
	madhan.raj@samsung.com, maze@google.com, motomuman@google.com,
	ncardwell@google.com, netdev@vger.kernel.org, pabeni@redhat.com,
	r.kumawat@samsung.com, raj.kumars@samsung.com, ramyashree.s@samsung.com,
	sharmasagarika@google.com, sporeba@google.com, srihari.k@samsung.com,
	ts413.lee@samsung.com
Subject: [PATCH bpf-next v10 0/2] bpf: tcp: add ecn_init callback to
 bpf_tcp_ops
Date: Fri, 27 Nov 2026 18:54:09 +0530
Message-Id: <20261127132411.2523201-1-irlanki.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av8pip2n63ZBofcE@google.com>
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
X-CMS-MailID: 20261127132303epcas5p4c8e774f6bce688ebdc0a4b7a29644dde
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-065,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261127132303epcas5p4c8e774f6bce688ebdc0a4b7a29644dde
References: <av8pip2n63ZBofcE@google.com>
	<CGME20261127132303epcas5p4c8e774f6bce688ebdc0a4b7a29644dde@epcas5p4.samsung.com>

Hi,

This series adds an 'ecn_init' callback to struct bpf_tcp_ops. A
cgroup-attached BPF program can use it to choose the ECN mode (off,
RFC3168, or AccECN) for each connection during the handshake. The
net.ipv4.tcp_ecn sysctl stays the default: the program sees it through
bpf_get_retval(), and out-of-range return values fall back to it.

v9 -> v10:
 - Split the selftests into a separate patch (2/2).
 - Skip the ecn_init BPF call in tcp_ecn_create_request() for SYNs that
   neither request AccECN nor carry ECE+CWR (Kuniyuki Iwashima).
 - Sort variable declarations in reverse xmas tree order inside
   tcp_ecn_send_syn() and tcp_ecn_create_request() (Kuniyuki Iwashima).

v8 -> v9:
 - Fix multi-line comment style in
   selftests/bpf/prog_tests/bpf_tcp_ops_ecn.c (sashiko).
 - Add copyright headers to both new selftest files.
 - Update the bpf_get_retval() comment in net/ipv4/bpf_tcp_ops.c to
   include ecn_init in the list of bpf_get_retval() users (BPF CI).

v7 -> v8:
 - Respin on top of bpf-next and convert from the legacy sock_ops
   kfuncs to a bpf_tcp_ops struct_ops callback 'ecn_init' (Alexei
   Starovoitov).
 - Drop tp->ecn_mode, TCP_ECN_MODE_UNSPEC, tcp_ecn_mode_eff() and the
   kfuncs; the prog is queried on demand during the handshake like
   timeout_init()/rwnd_init(), which also enables per-peer decisions
   on the passive side (Alexei Starovoitov).
 - Clarify the per-application motivation (AccECN for latency-sensitive
   apps vs bulk traffic on the same route) in the commit log (Alexei
   Starovoitov).
 - Drop the AccECN option kfunc to focus on ECN mode negotiation;
   to be discussed separately.
 - Replace the sockops selftest with a bpf_tcp_ops_ecn struct_ops
   selftest covering IPv4 and IPv6.

v6 -> v7:
 - Document BPF_SOCK_OPS_TCP_LISTEN_CB timing window in kernel-doc
   for both kfuncs: connections arriving before the callback runs
   will use the sysctl value rather than per-socket overrides.
 - Add fallback behavior note to commit message.
 - Remove Suggested-by tag per maintainer guidance.

v5 -> v6:
 - Reject non-TCP sockets in both kfuncs with sk_is_tcp(). The TX
   timestamping sockops callbacks run with is_fullsock set for UDP
   sockets too, so tcp_sk() on them was an out-of-bounds write (sashiko).
 - Fix selftest and comments: accepted children are cloned from the
   listener and inherit ecn_mode/ecn_option (sashiko).
 - Use standard multi-line comment style in the BPF selftests (sashiko).
 - Document per-socket kfunc override precedence for tcp_ecn and
   tcp_ecn_option in ip-sysctl.rst.
 - Reword subject: the TCP_ECN/TCP_ECN_OPTION optnames no longer exist.

v4 -> v5:
 - Replaced setsockopt implementation with BPF kfuncs.
 - Placed ecn_mode/ecn_option in the cold section of tcp_sock to avoid
   polluting hot cachelines (suggested by Eric Dumazet).
 - Updated Documentation/networking/net_cachelines/tcp_sock.rst.
 - Removed userspace UAPI and documentation for the sockopt.
 - Added new selftest for the kfunc implementation.

v3 -> v4:
 - Define TCP_ECN and TCP_ECN_OPTION in bpf_tracing_net.h to fix
   BPF selftest compilation failure in progs/setget_sockopt.c (bpf-ci).

v2 -> v3:
 - Use READ_ONCE() when reading ecn_mode and ecn_option in
   tcp_ecn_mode_eff() and tcp_accecn_option_eff() to prevent compiler
   double-fetches (sashiko-bot).
 - Move cookie_ecn_ok() to include/net/tcp_ecn.h and update syncookies.

v1 -> v2:
 - Remove unused variable 'net' in tcp_ecn_create_request() reported
   by kernel test robot.

Irlanki Sandeep (2):
  bpf: tcp: add ecn_init callback to bpf_tcp_ops for per-connection ECN
  selftests/bpf: add selftests for bpf_tcp_ops ecn_init

 Documentation/networking/ip-sysctl.rst        |   8 +
 include/net/tcp.h                             |   6 +
 include/net/tcp_ecn.h                         |  16 +-
 net/ipv4/bpf_tcp_ops.c                        |  21 +-
 net/ipv4/tcp_input.c                          |  11 +-
 .../bpf/prog_tests/bpf_tcp_ops_ecn.c          | 224 ++++++++++++++++++
 .../selftests/bpf/progs/bpf_tcp_ops_ecn.c     |  57 +++++
 7 files changed, 333 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpf_tcp_ops_ecn.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpf_tcp_ops_ecn.c

-- 
2.34.1

