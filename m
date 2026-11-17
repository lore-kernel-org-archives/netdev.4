Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794937231;
	b=EyQcXh26BEhYKIBFygerWHtg6Q6KrTsYtI5iAnu2oTmIcVuB5wDaHIfozbIuYBDkjNYT
	 jL+E0TnpXH4HEgvb+OQ610lCKsViPO3jgR280fpelkPsFXUojHessgjNnzDwoaSWN8q9g
	 V1VdXAyf9NrJ2LoAfPbKFOsz8tV7miCv3Tzo4R2Vpk+UcHf9hc04ASZj3ZrawGntr1jcY
	 79UYqRbLpPYP+QAgtpLNdw6/BqUVn5Y1HHUU25P7g40K/bPhu7Y2Tm8k8FDQhRBs+1263
	 DCUJSAQPEyBRZpUBQqexDit79JF0iSsSPvFVuKVqkATCPmpuLSLqutg5JeuzB3noCmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794937231;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NfnXEPcZubGYIvAuu0emS2kkZCekEVtpp7Kmyvr+j48=;
	b=a/jv3er4Qeb4Wxyt26dFrkJjU9hy77aJwwINDRtCxeTM+Es8zbrl4j070JlCeaXSIvzy
	 s9YuNyrRa6/QiHql6StZdO9Xx+QIwWP7FTX1Q4irc954E1y2/LgC7M/+efQ+2XhyTVXy1
	 PKvs2EWr97mVdN2otfxbg6c4J5PeH6HRHoBaB9i+HW+OkRQGZie01tXhVOrjWUo2mNMq7
	 XZlOBrsypBGqaRW53Z42Yg+hVi93H89/oiI2EG5TUBbr1vdwvr1v8gui5wetptsZNVpbH
	 XDLuEQ2OMmvJOAhYDQlVgkcHbSBoEs3Y82eLMc5HZqVCA+gxO2Ooa+EuRfSsxG8Qk5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=Pw+yyWHv;
	arc=none smtp.remote-ip=115.124.28.219
Received: from out28-219.mail.aliyun.com (out28-219.mail.aliyun.com [115.124.28.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F9E606A31C;
	Tue, 17 Nov 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05F9E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=Pw+yyWHv
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794937221; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=NfnXEPcZubGYIvAuu0emS2kkZCekEVtpp7Kmyvr+j48=;
	b=Pw+yyWHvhW7avJpMHYmnES9fKDVVdWdnAg/3X3sCk1ifTNIm12LpGR5tzyS9ScIaSYXyz0uabrS+x2sw0F9cQQ3oUmk8DAigKs6PJrMYMyxrsng2vAap0X0XHWveuJG3HhVX6LBzuFjnz6SqD6vLE89LIGqqnvBpiWpCuRQbs1g=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.04475058|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0078416-0.000222638-0.991936;FP=12416432432656457696|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045099153;MF=fangxy@xiaopeng.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.k4BATDp_1794937219;
Received: from localhost.localdomain(mailfrom:fangxy@xiaopeng.com fp:SMTPD_---.k4BATDp_1794937219 cluster:ay29)
          by smtp.aliyun-inc.com;
          Wed, 18 Nov 2026 01:40:20 +0800
From: Fang Xieyan <fangxy@xiaopeng.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/5] net: wwan: iosm: validate MUX DL lengths and offsets
Date: Wed, 18 Nov 2026 01:39:35 +0800
Message-ID: <20261117173940.34970-1-fangxy@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
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

The MUX downlink decoders trust several modem supplied lengths and
offsets without bounding them against what actually arrived: the block
size from the transfer descriptor, the ADGH datagram length, the ACBH
block length, the command chain offsets and the declared parameter
length. A truncated or enlarged DL block makes the driver read past the
received data, hand the network stack an undeclared payload, or walk a
command chain that loops or redecodes the same bytes. The aggregated
datagram block path is already covered by commit 526b8ef54668 ("net:
wwan: iosm: bound device offsets in the MUX downlink decoder") and is
not touched here.

This series adds those bounds. No command type, response or protocol
semantics change, so a conforming modem behaves exactly as before. A
parameter too short for the member its command type reads is dropped
with -EMSGSIZE, which also ends an aggregated block at that command.
Patch 4 is the prep change for patch 5; both carry Cc: stable, as patch
5 cannot be backported without patch 4.

cmd_len is not a parameter bound in either path. In an aggregated block
the boundary is next_cmd_index, or the end of the received block for the
last command. In MUX Lite there is one command per skb, so the received
length is already everything that command owns; the flow control decoder
treats a mismatching cmd_len as a legacy device, so the field is a
compatibility flag, not a length bound.

Patch 3 bounds the ACBH command chain by the received length rather
than block_length. Although the structure describes block_length as
the length of the aggregated command block, the uplink encoder
initializes it to the ACBH header size and does not update it as
commands are appended, so it cannot delimit the received command
chain. The field is sanity checked, while first_cmd_index and
next_cmd_index are bounded against skb->len. The walk's
array_index_nospec() call is removed: it bounded a byte offset by
sizeof(struct mux_cmdh), zeroing every legal offset past that size.
The offset indexes no array; array_index_nospec() is kept only for
if_id, an actual array index.

Patch 2 relies on the ADGH header check from patch 1, patch 5 on the
ACBH validation from patch 3 and the parameter pointer from patch 4.
Every commit applies and builds individually, W=1 drivers/net/wwan/iosm/
is clean. Found by reviewing the DL decode path against the MUX protocol
structures, not reproduced on a live modem: reaching it needs a device
that truncates or enlarges its own downlink blocks. The series is based
on the net tree at 145480b28ca8.

Changes in v2, all three points from the Sashiko AI review of v1:

- Patch 5 bounds the MUX Lite parameter by the received length alone,
  not by cmd_len: v1 dropped legacy FLOW_CTL (cmd_len 16..19) and
  OPEN_SESSION_RESP (16..27) even when the parameter bytes had arrived,
  defeating the backward compatibility branch in
  ipc_mux_dl_cmds_decode_process() that exists for exactly these (the
  protocol minimum for cmd_len is 0x10).

- Patch 2 rejects adgh_len == packet_offset too: the zero length clone
  reached ipc_wwan_receive(), which reads skb->data[0] without checking
  skb->len. mux_dl_process_dg() already rejects the same case for the
  aggregated path with dl_head_pad_len >= dg_len.

- Patch 4 gains Fixes: 9413491e20e1 and Cc: stable@vger.kernel.org: its
  by-value signature copied all twelve union bytes even for a four byte
  response, and patch 5 bounds the session responses, so the two are
  needed together. A prerequisite itself marked for stable and present
  in the series need not be listed, per stable-kernel-rules.rst.

Patch 1 is unchanged. Patch 3 changes only its changelog and comments.

v1:
https://lore.kernel.org/netdev/20261112125201.1019-1-fangxy@xiaopeng.com/

Fang Xieyan (5):
  net: wwan: iosm: validate the MUX DL block length
  net: wwan: iosm: validate the ADGH datagram length
  net: wwan: iosm: bound the ACBH command chain walk
  net: wwan: iosm: pass the DL command parameter by pointer
  net: wwan: iosm: validate the command parameter length

 drivers/net/wwan/iosm/iosm_ipc_mux_codec.c | 187 ++++++++++++++++-----
 1 file changed, 141 insertions(+), 46 deletions(-)

-- 
2.50.1

