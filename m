Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538054;
	b=BxDqnqNDMxlD9F8+RL/TJ0A8FWZACcblzyYiiQeiyuXaVGu/1mthRqn/DRUX3px7QrJr
	 GwObSecx/CoPIKM7019EWVPvDJXQwVBL9kOVlDamDNgcilftSGRf5tJH/0KtCtBQjMOzs
	 g4yzIapQn8/xIumDNLUssULomK0F/XYO6rNejLeUBswDPPCkcSi36DhltTgNKuQmyWLgw
	 IZQAVEtdGn+Z/Xlxhwepj7erHEdxdsycVYiby+1b2uXZujGeHbBGsWvmJbt03wixAeuMG
	 zIJ3W+TpYkEuSZPt5BOVTKcQ8lXN9Q5rn83OTPZF2wUNTsfsGiejmA6RNeh0ZRk9SOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GoOWhhjKU5jVvvb8PvpAssAoe/TXzv/lHdPf2JDtI9Y=;
	b=X6hwLg8p0vx748EW94sezdExQOuJyGZDlb8vThMgC/ZQ3TdxHLSchb93Ik7AiBE1XbkW
	 NPJ2N5qP71n5CTisb//ViOsSO5xHwOS/YL4KzDf6ICM3TGPn7agqizwQx8qoXMiWpv9eY
	 dO/vPghFh+zXvtwvHBjS6CmQBs3RhfClwYIGKtVfTj1EW/n3e0Jj2Od8hAGOMNfSR34S4
	 APJvUnYU2rwdcuk2mk2N3+W7snb7+J8H70pIBGDp2VFfwcsOUNlmoaMihgiG67Eq8b/mx
	 04+QVJ9niTbuUpwy1n1gH+8c+PSFAFXiXqwOOUO7hYqMCb6Rm3Z4rQ5s9PuBOfNOZhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9gP+Bjw;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3301C606A336
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3301C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X9gP+Bjw
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d427836e9so650933366b.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538052; x=1796142852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoOWhhjKU5jVvvb8PvpAssAoe/TXzv/lHdPf2JDtI9Y=;
        b=X9gP+BjwFvdjp4nbrN+RJe1zYuYsPTY+injwk6vhdwJHQEdWgjvqONAhiaJTzkJSgp
         crXw765euWzGINDrXLCuP+JvDxCqTHBEapC8UZ+b5ibfZ1EBiVhdMSbkQ/Gc0L0ii3E8
         bKcGFd63aHakPXEKko+UFdnU9eq56HPPIei87a+kpPFoO7Yoargi1FK4me6mrUZeOmX5
         K2thSLMtjc4G7VY/+G1xaB3YZkzz3a4XKJobKZoEVmIfugGMZjfMy4fH1hF08Mbha1Q7
         y/BuZwm1JyEbnz1s7z7gLwgOGPktcYG3Wu0o8z0+qYhiQ7p9eNcepWt6NvtMXt7vV9R9
         +zHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538052; x=1796142852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoOWhhjKU5jVvvb8PvpAssAoe/TXzv/lHdPf2JDtI9Y=;
        b=wwyFM2uY6wdB9EB5sBZLMVpwrPSgMAKq7k03PIyaKmrMXfjadHzoBXstlzural0G1I
         uSCgDFUEeJUZd2pvcjkPCzanmIRbFB13w7CaYIyVQmPo4ewJ0ft2as3DRXmNidGTJ90/
         ov8mEdaqOc9384LBZN2ousdyXgzCPc2hq+iP2GdSBQxdk22HYrjTdaMlX9qWv+0laJ8w
         1JXx7gLHadi4C96QlX89cv8gktg0u+bsjv0RFak15sT0g/KcFnyTL9m36ob9C8HtqhvG
         LTqM6oWMyWs+J54o7qwuLR/l+mvb9T7W9RQ9jPLFVMNvUNIxG2f2P8VAQmPSWkN4srKm
         teoQ==
X-Forwarded-Encrypted: i=1; AL+hErHInyH0q2jUatc68p7zwNeX8IyxmQkDwvBFLcRgKzDwilY5ZXFKbJDmd8tr4//DvwjBZMeIkN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xJ4FB3tfusMll1+1IxlJFws+CuFCOeYrGOX9JHheujR+qh+qI
	WARWwxYKyT3kzd3bALKWxpqfAw9SvOlizNGFqZsVhmv3ornp5Euuqszx
X-Gm-Gg: AZFdTZf2UDhI3tQgdaqCd2+t+Lop9Z0tFLhbH1mbBnNlZSIyfIrXZGRm6/OmRFX4i9S
	WOV0Fb7zq7p1IP91Lh5+eFOJqsp+wMzBWnz6eZoYP/OFg7p3eO7DtHoWVNCBUyZyzdrv3n5ocsD
	wbxpMCq2DKfjvfOUvEyBIMKGWICvT1OHurGthNp+vy5DvQm9wTaZNYgpfgyxrjzCO9W9O26ftDo
	pE78eFzceSPiSAX5qmCskcQUfYgNuBaUxn8RZpv+opJzy/qxHL8jmlzmbMauh9cuc+JXklBKivz
	tncZn01hKgCvPltgUcsbZmOvS+9qWn/LMbRppR+vyVsm3OEnVPBzg4I6U/wKpA7qo4Kzv6Czpxo
	9lBa/n6P1apjnUcACO+/agdrk7BOLl0eVJqKvhHApLGfE/pWGV91Vy+YnW4szcENiKmsNGujmkf
	IQ/nvgIAGs4vgDoCZE/4TZukJkij8N5ci8nPWYI4ZcqFEUA2i5g54SGFcqPXJlp2Ry/Oh0gKUMj
	QdgQZuMUqrrATdVjaz+Rd0Q0YPPN9Tx6hud46Ckr5geN3POdsuCQVtUPMeF8EKnthcoWSDLW5J1
	0KwRHK+6JsOZ3sz2pqOBivpC74EUChMrJqLpjpGYo/UBA/fVJ+Np96y/Ve+Arbme84vjP7ofPnm
	l
X-Received: by 2002:a17:907:608c:b0:c2e:6a4f:a88b with SMTP id a640c23a62f3a-c513a1f5c8cmr1281794066b.0.1795538052292;
        Tue, 24 Nov 2026 08:34:12 -0800 (PST)
Received: from theodors-laptop.dotcomltd.ru ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm542032866b.75.2026.11.24.08.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:34:12 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v3 0/2] net: do not point a pskb copy's mac header into uninitialised headroom
Date: Tue, 24 Nov 2026 19:33:56 +0300
Message-Id: <20261124163358.755345-1-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
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

pskb_copy() keeps the mac_header offset but not the headroom, so the mac
header of a copy of a received packet points at uninitialised memory,
which nft dup can hand to userspace. Patch 2 unsets the mac header in
that case, as Florian suggested on v1.

Patch 1 makes nf_dup skip skbs with bridge netfilter info, as Florian
suggested on v2. It fixes a second leak, where a tcp reset reject of
such a copy builds the RST's Ethernet header from the same bytes, and
it has to go in before patch 2, which would otherwise turn that reject
into an out-of-bounds read.

Patch 1 also stops dup for packets that come in on a bridge port and
are then delivered locally or routed, because br_netfilter keeps
SKB_EXT_BRIDGE_NF on the skb until the bridge transmits it. Is that
acceptable, or should nf_dup keep duplicating them and call
skb_ext_del(skb, SKB_EXT_BRIDGE_NF) on the copy?

Found with a custom syzkaller-based fuzzer.

v3: add patch 1; without it, patch 2 turns the tcp reset reject of a
bridged dup copy into an out-of-bounds read in nf_send_reset() and
nf_send_reset6(). Drop the nfnetlink_queue patch, since nothing
produces a bridged copy without a mac header anymore.
v2: fix in __pskb_copy_fclone() instead of nf_dup; add the
nfnetlink_queue patch.
Link to v2: https://lore.kernel.org/netdev/20261117175835.745796-1-theodorlarionov@gmail.com/
v1: https://lore.kernel.org/netfilter-devel/20261116105113.128791-1-theodorlarionov@gmail.com/

Theodor Arsenij Larionov Trichkine (2):
  netfilter: nf_dup: do not duplicate packets from br_netfilter
  net: unset the mac header of a pskb copy that points into headroom

 net/core/skbuff.c                | 2 ++
 net/ipv4/netfilter/nf_dup_ipv4.c | 6 ++++++
 net/ipv6/netfilter/nf_dup_ipv6.c | 6 ++++++
 3 files changed, 14 insertions(+)

-- 
2.34.1

