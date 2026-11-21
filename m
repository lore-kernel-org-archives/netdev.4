Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285624;
	b=pfZbKpbQXeCisvsiCN0oJP4b+jriQyUxs45Ec6s+YQSOmy8R2f+hX9QslvCG4wvmdzSR
	 aHevBaQXr/6L+0KKHtC/9Yc/QJYLMMIDUn+p1KteIVbaBHUK8IVJZdd6rq4ZsB33lH424
	 1Va4R0+5HEkfdrX7JoYbfRSEZCcCQTIbpXCIAQgUqcF5V56QjJCpgEyjR5nqLHewQ/qJo
	 RCjPVAtf/yCZR/IBYFNxyif3I/y99Pygklz/QUirVffJAIF4YicuThTAuh91q24LRtXXo
	 gz6MEyW6CpEDWoqom+8ysxo8ugaz496kiEzbMOLuJx6K+PKHcZQpYehaVBJbskdNB7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
	b=IDC4/QtlK91rRQOJ5qWoa1wsoJs4y8RJ8qw460HFSqQpumSDg9+MQK9UgOMC+Zt57ULw
	 Au/Gpg3WobyHDDfnMId5nhnI6jASsYDzhszNV3aUXeJX+k0hNB4CfPB0JFbqSuD8Ak4Hf
	 aHxuFO1XE/IB9MLPZtMTyUqtjSKkYPo8qW9pmNQohFdHQfw2hJOhkvNRh1gMfPkDEtacE
	 CzQDihUTqeRAMhpeGGJfN/2n9CTymaObjX2jBLIBzMgI164xOl7QBAvBZjz1IM/KZ2rKe
	 +/VM0mn+RqFQsJwUGTzyy/rrLtohGRa7HypnGkXyqAZ1bjd/OQwqM8iXB8Ryh4XSDUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=v0fW51fZ;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B2F606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B2F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=v0fW51fZ
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c5127c7abd5so330332366b.3
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795285623; x=1795890423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
        b=v0fW51fZZ/SGc8wHJ1cKhm3+RD6J9PkbqhNgq6XuNECUhMVQaUDAEVRtVAM3hnqkYJ
         dwkeN1rv9+eSxpwci0y9LeeLRNjt4h9W3Ing/DJR/ZARxdkuXDEpWNq/tIU86Q/7qmDS
         v5M1lWbsKBWBrvy9d9K7BZ1LYFAfQHp3NITaJXhNbbBSP59o22P8JeDvlrxH4T3D4NhD
         X47bQEoKh0aBvOqxWi61Y8SGR7mWHACC+tWZx8/zzmOLp3/rog4+vQGEbXlPRbd5YOwc
         bGPB0gWn3axLCM7ZK5M1W2YgU3P22g2tJ38ZjOeBKoefUg0zuQQ5L3hmp+JUqx5q/A0o
         ycXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285623; x=1795890423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEswlKRu/m9QVt4dqb19fLYqCHJHVZ8xOxsIyuj9bq0=;
        b=MCptUgHt8I0eXLhT4jKT6FaM9pahl4xl2N5QJ1Lv+8i/d2R0Wg8HOz2UAJv0er3eX6
         aO/oEl8YGvTK9XeMS40p5+81m/OidajyopOYofc8VCG9IpV4+HFM9sDknER7BBlNlPZz
         Qx54OL1+8BTdhPI2q0oEN794KWA34LcTp1ElpXxglneu3N8/jO8lJXMmbfG8UXF6zIrT
         6V+Zdebv9oZ5hOjrxIOUofiQVQ5O68Q5hEiSo/4d+9QLdzHDY/DjniHnhhH4zXdxDIN5
         aCTV1ma0cwJgFxc5v57YKqpu808DmmTG85PO8xCjIFQthTsey5ABFvquOV6bJSatixJH
         kQJA==
X-Gm-Message-State: APuU4Z+Smc8kC0hiRM8Mtr9KB9GidyRKvzdSVN2aRC4tHL8SQkAFlaSw
	bVx6T0m/akCEOYJ8W+tt3PwJf7f+Um8wnBB1xE92D0wcTDshjVKGxUlBcfTxA+xcZDDRdXv0LFf
	O0QggBchJ
X-Gm-Gg: AZFdTZfXJX/enbVWWtnOJwfJWpxp0oWCVrWSf5LYtPpgdjPDPOUcp5iG0i80hSHelaQ
	2tNGJVoI0/k8Y10OmzoUSw7OPdlqXRSsi79WkoYl6Is8EbhBnRylL1zlp+HwD+FJDB7xk0OU17Q
	4YaWZj4drwPN+/2PfbFCfmllz+NcvnHu/vllSO7OkT5hVCUiV1EcBLEyoRnFhNaYSaudO+aUT6e
	8VQMUvMd+RQixLHLQukkhLrNozoXi1TUTB2CqdUy1xzN8Z1drUKh53bq/O1FWTC8LyvxFDVSgAm
	YUMIBvrXo25o7bvvzRy/yTNhQtCIZTe8PaN71eGojcVw0+7FLVUMEGGl6o/pgNaEuRNMaZ7mKDO
	nvM4n8qjsoXmeuYxWnXzSExqCcPGVThxvV7InMcrDehAGB4xN+IN/e0tL62F3oTTQt4KWOzUh6y
	0p5ATgzFd5o6PrTpI/G6j+ui6GcJj9EvOEwlaD2LfDEf7eIxbWtg+Q8c8H8azho37bMDxq1GOPf
	eHkB8FI0KLlTEU3UudFB2PY727zz0Ao3/BdKphWEfyPylX7ZrHRSEHioS+817MZWRZ3dJquUnRT
	v7y7//l3rtL7VISr81kcE+kLHUnHBQtpds6OM6usu41HYsy0R/WJh7yTeUq+wS+KmfmfkEvk2Kx
	bkDWi9Pp5mASkvytQw6HsVAMnSBFrYpeNCbqhFpg5VcBAiux0Q3ojiNBa1Fn6IisdKgJaZWZTTn
	4/WyGz8Z0uZpE11UmGxcX9sCCOVjp4ymPVTH+cbLrF2laOMRDNeAz5xgxKiTueBvdDKgg6lXRjk
	gQHrcbTYi9hHlY5VCZ7MkmFrRnwNkU6So6R9Q2kSlA+qFvTua2Wy6a6st7MQasajSTIaLw9qMQT
	ot9GUQ+pu35rT5/PTgkVb9fkSq/XI2eOIZSkXWtIU7LDra2AWgcAmJc=
X-Received: by 2002:a17:906:da0e:b0:c41:731c:534 with SMTP id a640c23a62f3a-c513a8590b8mr434863966b.24.1795285622600;
        Sat, 21 Nov 2026 10:27:02 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b001172sm224519166b.79.2026.11.21.10.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:01 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	willemb@google.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	andy.moreton@amd.com,
	alex.austin@amd.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	izaiahsun@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 21 Nov 2026 19:26:58 +0100
Message-ID: <cover.1795284858.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

GRO sets SKB_GSO_TCP_FIXEDID for a TCP packet whose IPv4 IDs do not
change. Since commit 3271f19bf7b9 ("net: gso: restore ids of outer ip
headers correctly") the flag describes the outermost header and
SKB_GSO_TCP_FIXEDID_INNER the inner one, so every path that adds or
removes a header would have to move the flags. None does, and a TCP
stream that GRO merged and that crosses a tunnel boundary is segmented
with the fixed-ID state of the wrong header.

Patch 1 lets SKB_GSO_TCP_FIXEDID describe the innermost header again and
replaces the inner flag with SKB_GSO_TCP_FIXEDID_OUTER, as Alexei
suggested in review of v1. A header added in front of a packet that is
already encapsulated clears the outer flag, and ESP transport and BEET
mode with crypto offload, which keep the IPv4 header, copy the inner flag
to the outer one. Two flags cannot describe the middle header of a packet
with three IPv4 headers: software segmentation uses SKB_GSO_TCP_FIXEDID
for it, as it used SKB_GSO_TCP_FIXEDID_INNER before. Patch 2 adds a
selftest.

The hosted Sashiko AI review of v2 2/3 of my "ipmr: forward GSO multicast
packets" series reported the issue [1], and the selftest in patch 2
reproduces it.

Tested in QEMU (KVM) with the selftest, 19 cases, 400 segments each:
- net (d5b89d55a322), 1 run: 6 cases fail. Fixed inner IDs increment
  after IPIP over IPv4 and IPv6 and after the ESP tunnel (390 of 400
  segments carry an inner ID the sender did not use), the outer IDs
  repeat after GRE and VXLAN over IPv4 (10 distinct outer IDs for 400
  segments), and a VXLAN stream with fixed outer IDs keeps that state
  after decapsulation into IPIP (10 distinct outer IDs).
- v2 of this series, 1 run: the ESP transport mode case fails (390 of 400
  segments carry an ID the sender did not use).
- this series, 3 of 3 runs: 19 of 19 pass.

Changes in v3:
- Patch 1: clear SKB_GSO_TCP_FIXEDID_OUTER in iptunnel_handle_offloads()
  and in the BPF LWT encapsulation, where a header goes in front of an
  encapsulated packet; the new outermost header kept the flag of the
  header below it (Sashiko).
- Patch 1: copy the inner flag to the outer one in xfrm_output() for ESP
  transport and BEET mode with crypto offload, which set
  skb->encapsulation without adding an IPv4 header; v2 gave that header
  incrementing IDs (Sashiko).
- Patch 1: name the paths that change the outer flag and the middle
  header that the flags cannot describe in skbuff.h,
  segmentation-offloads.rst and the commit message, and list
  SKB_GSO_TCP_FIXEDID_OUTER in the bpf_skb_adjust_room() decap flags of
  the uAPI header (Sashiko).
- Patch 1: wrap lines at 80 columns (NIPA).
- Patch 2: add an ESP transport mode case.
- Patch 2: skip a run in which GRO merged nothing before the outer IDs
  are checked, and check that ESP tunnel mode outer IDs increment within
  each packet (Sashiko).
- Patch 2: delete only the netdevsim devices the test created, also from
  the EXIT trap, and before the namespaces (Sashiko).
- Patch 2: make the receiver's -c optional, as documented (Sashiko).
- Patch 2: use slowwait and check_gen_prog from lib.sh, and create the
  netdevsim devices inside their namespace, as lib.sh does, with the
  new_device write checked (Sashiko).
- Patch 2: report a receiver that is not bound within 10 s as such.
- Patch 2: fix shellcheck SC2016 and wrap lines at 80 columns (NIPA).
- Rebased onto net d5b89d55a322.
- v2: https://lore.kernel.org/netdev/cover.1794139176.git.julius@bairaktaris.de/
- v1: https://lore.kernel.org/netdev/cover.1792857378.git.julius@bairaktaris.de/

[1] https://lore.kernel.org/netdev/179182559332.434549.18294510093742639467@kernel.org/

I used Claude (Anthropic) to help write these patches.

Julius Bairaktaris (2):
  net: keep the TCP fixed-ID flags on the header they describe
  selftests: net: check TCP IP IDs across tunnels after GRO and GSO

 .../networking/segmentation-offloads.rst      |   8 +-
 .../net/ethernet/mellanox/mlx5/core/en_rx.c   |   8 +-
 drivers/net/ethernet/sfc/ef100_tx.c           |  12 +-
 include/linux/netdevice.h                     |   2 +-
 include/linux/skbuff.h                        |  12 +-
 include/net/ip_tunnels.h                      |   1 +
 include/uapi/linux/bpf.h                      |  16 +-
 net/core/filter.c                             |   1 +
 net/core/lwt_bpf.c                            |   2 +
 net/ipv4/af_inet.c                            |   9 +-
 net/ipv4/ip_tunnel_core.c                     |   2 +
 net/ipv4/tcp_offload.c                        |   7 +-
 net/xfrm/xfrm_output.c                        |  10 +
 tools/include/uapi/linux/bpf.h                |  16 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   2 +
 tools/testing/selftests/net/tcp_fixedid.c     | 432 ++++++++++++++++++
 tools/testing/selftests/net/tcp_fixedid.sh    | 427 +++++++++++++++++
 18 files changed, 929 insertions(+), 39 deletions(-)
 create mode 100644 tools/testing/selftests/net/tcp_fixedid.c
 create mode 100755 tools/testing/selftests/net/tcp_fixedid.sh


base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
-- 
2.53.0

