Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150059;
	b=0oyslFgCqqJHGzCIExwtUKWxMOLg0nMJh8Zqvzwq4xOR9cRsrOHw9WQJ9rA+pVAICEwe
	 h51B7caK23USyKsUqLG96zwl6rx71iE8QKFZM9DMwau2MxLE53SbX0GIJmZRTop5U0QNZ
	 qiqYjAI2PZ+d3EYQzUBLDIfkfqpwIPX56gzVcb7As7W3HlefjW25zLlyc47mdlFqqYx55
	 7U64wUVXz3LT4ZILiF7RsqsJOdEZmPy2QMzaZLJV6FbO6+vodATe7R85bnwAKeEfQx/Cp
	 81hByfGwabSwI/r9pH/9+Bp5aauneN70SIFBzHZ6pd/rZQQKmsU0fKv1txrT5b2wtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wyC9d9SoyF2ZyiffP4QhM0CpfiDlvbBQ1BMIgXdq5yQ=;
	b=iHKOqI81pdxnaoJOC0mh7thil13ZkUheAwW8wWjpsJzrOOnFIzHxDgVVqhD7W4HsiOOF
	 DHCUqGFQMKXbPnXlH/ddHJPRax38r5CCcXQZBkemyTQspSF1GyfH3SckZM5uKKppVLM4R
	 9S9J8CR5ZDlrXCOxye+7NhoDSXFWU2+VHQ4qTGnIRE84/79D2M2ES2fw0nejosKWC33jB
	 cfYQxC//ECQ4zKw/7jVmsc06GK9c971u37BPFG40vEQ45pyDMk9IB43nIlYNuD0yxbhdP
	 592LiMhSf+ZpyvK6XvBk4usIMQZTD54nQw8f21P5sD+qUtrgiz6rRnRleh+h5rmvJKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8mYi8U3;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358FF60A261D
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 04:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358FF60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8mYi8U3
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc53938a8fso402501137.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 20:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795150057; x=1795754857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wyC9d9SoyF2ZyiffP4QhM0CpfiDlvbBQ1BMIgXdq5yQ=;
        b=i8mYi8U3VAPe+YTVRMGfFkkk6yvsF+ifOjSeb8wrHPb3Fwg90VuJ4zu37PPCiYYbe7
         hSDLRrH0Gd92ggFp2YaZFnAQavgeRhn+ubDFl/wAnMRC8rbZKB0g9WbBSFkEDFkSkUqY
         2ZSAtjpwo+oWfW1g84onxpuReIjwGprvnOGpGn2EFV5HGSvEbLm6Gwgr58JCyOv/Hu9r
         yskk726/zlD2H6ZCUIt5vFM8ZiBeR5QTQV9r5j74MnwYFV8OlXwYsGXn7ABQ0m1tf/XL
         aG0t//3QbyG5OrdxEQhWpn9DZtzfIcOZnOAXmmI5f69iaxi3x4W1Eurb/RHRyB4Lhkp8
         esrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150057; x=1795754857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyC9d9SoyF2ZyiffP4QhM0CpfiDlvbBQ1BMIgXdq5yQ=;
        b=x85JOaLPIemMV6j2bfgYgBiiigKqI3L6MRHp4FIIrl/hOpLxxzo6lMXQW9izyNUi3v
         3TzVsQp8SikzjvDyhED2jUqeZnMWSFAaRc6EKFzgUeUlkaJ9g2NsSX26W4qiXpq9dUKX
         KchA5IDYYanma1Zf/XxKjKH/vRFl3aS2KPZjZaovNAvjIQ1rcsqnBuaV9xdtaha9+x4M
         q3isNpeUog6ucIPomPtlW57g/xswcKGWJaX8FVipphA77KjG3W4t3qdR8wRLK6Du8JXp
         CZ0qgbQhBHW2i4rActO0EEJI0zqQrnyV5u2cZRyTy3E8iIlbdjKOetG+XM4MPPFLXy6a
         XI6Q==
X-Gm-Message-State: APuU4Z9OkTVyPWhSJPSqrdOC5hZRIJFODUoTQqTaie7S6ppNn4fS5vIo
	FICrW9pMOW31X0SOLRlWo3UtTl0HTak82kaoOrx7/9K1JDxYTP8gP2ibrOxFag==
X-Gm-Gg: AZFdTZevoKRYgXvBIkqz6yYLAlo2eN3QzYyJE+ZCruk6wr89488IxkVyoqbE31uebp+
	/52Nd57/8npSJYw/dk7SlbTSq5ACO1gZnc36UU+h4dUfKTkeUSEcAZkm6IfwdMcPHFHZr1UAwez
	eRw/PzJiZ1bI7LjV7iyEz6h0bAL+34R/9pzdQVBcseeLuc49GzzwVcN3f3fkKmIPyt8gNez7iIy
	6oS3GlWRSPE9POpVCfYt7YOlIwf7wwAssUs3nZSlH/MXGIE1X8pYwhe2DOeuMXaxQF6e4HYXWpw
	aitIqlt/qVGjZg/aWR9eN/9V97jeyXj+RL1ynbU8/GBjsrwY12zrs+a7vqa6rwZXy9YotVL3vtA
	rvOiqG94l2OAhBLK/Gyms86nH3muTdFWux80ere6vxJqzs0gOT1e7fSt5D+0FGdnCTrxLCCgNmw
	UlTixeMQnXJZfRzszBXg1lwL/AZ8Stv9TW1vjWVPPJNoYT2J3pIIadtiy+ecBXxIsInnc3VhHET
	UUqS8II5okkg2FDJa4uo9VUXqxp6+jE446MJTZC7Ax2tjdIMgRktpAJkHK3w4RyT5vvbdYOye6R
	u1n0Lfz/9PuzCw1oEGWn9Sd0UTj2RBlH+zV5yzNmMsseGMxBvVK5VZb2GQ1rerwFcB5ahA08yS3
	V0cdVxAkpuqXVA5cGr4KV2AFsne6FoWYOXLwKp69z15S7NGE7cHnBvQPw3OqO+wj0Qu5vcZpwDF
	lzZi8jqcUq/sbg/nh0/Bs38larabsQC6o=
X-Received: by 2002:a05:6102:5698:b0:7d2:8610:3223 with SMTP id ada2fe7eead31-7d73968ae3emr871696137.34.1795150057173;
        Thu, 19 Nov 2026 20:47:37 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f92680sm1966811137.5.2026.11.19.20.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:47:36 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net v2 0/2] net: gso: fraglist segmentation fixes
Date: Thu, 19 Nov 2026 23:46:38 -0500
Message-ID: <20261120044733.222627-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

From: Willem de Bruijn <willemb@google.com>

Fix two issues when segmenting SKB_GSO_FRAGLIST packets.

Patch 1 unshares the head before the TCP fallback to skb_segment()
rewrites the TCP checksum field.

Patch 2 falls back to skb_segment() in more cases where
skb_segment_list() produces incorrect checksums: tunnels with outer
checksums, and CHECKSUM_PARTIAL packets sent to a device without
checksum offload.

Testing

Tested in virtme-ng. A sender injects TCP and UDP GSO packets (20
packets of 20 segments of 1000B) over a veth with TSO disabled. The
peer veth has GRO and rx-gro-list enabled, and forwards the fraglist
skbs to a tap device without offloads, in three ways:

- routed
- routed into a vxlan device with udpcsum, over the tap
- bridged

Each for IPv4 and IPv6, and with sender checksum offload enabled
(CHECKSUM_PARTIAL) and disabled (complete checksums): 24 cases.

A reader on the tap verifies the IP, TCP and UDP checksums of every
segment, including inside vxlan. For TCP, a packet socket on the
ingress veth holds clones of the GRO packets, and checks whether their
TCP checksum field was modified in place.

- net/main: 14 of 24 cases fail.
  CHECKSUM_PARTIAL to the tap has incorrect L4 checksums, routed and
  bridged. Vxlan has incorrect outer UDP checksums: with IPv6 inner
  packets always, with IPv4 inner packets only with CHECKSUM_PARTIAL.
- This series without the skb_cow_head() of patch 1: the bridged TCP
  CHECKSUM_PARTIAL cases, IPv4 and IPv6, modify all clones. Routed
  cases are not affected, as ip_forward() unshares the head.
- This series: all 24 cases pass.

Changes
  v1 -> v2
    - new patch 1/2
    - patch 2/2: move the test into helper skb_gso_fraglist_ok()
    - patch 2/2: rebase onto commit 22b7cb932c6a ("udp: check frag_list
      IP family before using skb_segment_list()")
    - patch 2/2: commit message: explain the skb->encapsulation test,
      reference the existing skb_segment() fallback, drop the claim that
      skb_segment() is always safe
  v1: https://lore.kernel.org/netdev/20261111221129.829218-1-willemdebruijn.kernel@gmail.com/

Willem de Bruijn (2):
  net: gso: cow head on tcp fraglist fallback to skb_segment
  net: gso: fall back to skb_segment when fraglist cannot satisfy
    checksum

 include/net/gso.h        | 33 +++++++++++++++++++++++++++++++++
 net/ipv4/tcp_offload.c   | 10 +++++++---
 net/ipv4/udp_offload.c   |  5 +++--
 net/ipv6/tcpv6_offload.c | 11 ++++++++---
 4 files changed, 51 insertions(+), 8 deletions(-)

-- 
2.56.1.750.gf70dc682cf-goog

