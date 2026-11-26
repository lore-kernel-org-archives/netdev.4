Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681960;
	b=CucpOXrS3dZuGGXLqBFu0tzIvhGoKXdMmrJ516O09H0gCJW+3aTJOJCVDvYsMI8kAvqh
	 YXLOHqvl9uJJT7NJqRkfnOmR6Tzu+Hzw+Fbjtqa+n1tBmpqB/guKAPBL1U1ncKlQnoaCH
	 j2Dt8RlTvEYFY5PpVYne5s2BRBtB2HqvsbP6Hp/yHogvZDKPYmUrea3/lIiUDFoQu+AAo
	 UywAI1AnL3XriySkN96NxDmrNJEhXI6C5Xh6blXfrbhpAr1llnlRFVHvEkF2nEuVp9whR
	 2wECJi4rFuDeRdxcsbKoScYWKxoFbI4UBJSBlSXsoekX0nlhPtoT/R4hCmuHj+l1JWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wzjJUYtJq/00jKf5atGKZJsY/VwF/Fx8FYMZJrmIn00=;
	b=vvxjDWc5U3Y8Wy3UBvg3+fli/dAjKmMIIlUSlpkCK/4S0dxV7+UR2N8HlQxRd5Z5UuZ1
	 VLjC2zdEjgA6ELZ+mpn7imeHcqoN73qSGst1GCvWLdxuUSBEGI94lVg0+ErULLT8Iysbq
	 qZB4kpDoahwbsW1ykCN6ie1d9YU3CjI9yPgrA7+EbmPJ4UdvsMCesj80TpednNcmzrrkW
	 auCtI1bCGmB9uWH0jn2gyeJh+pZULKx8ZCAmtaL57KXtzzV7ULGMD++jI6Hc33GOWTnM2
	 kyFtB4q5s+bKwz3Sf5TaDTx585Jx8W9fWBcvvaPJfUa3fbvA/aL2lUfWt4DM7R8Irew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PtljBC/O";
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61414606A32A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61414606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtljBC/O
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2739820a12.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795681959; x=1796286759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzjJUYtJq/00jKf5atGKZJsY/VwF/Fx8FYMZJrmIn00=;
        b=PtljBC/OMu+gIK/pomFMLQGhgxHPIInM/bASFncZErxN1Fh+6ARFHis8rY2E5+SQD+
         lsd6H9QCdPp0ip1ywkclyQ4xnl7YY+YKdBxwSqfcYR8Xl2XZvCS98wYnLTAhPZEpabth
         n3Gx2NdzH6fKqxvzmE+k6obTbVvKLeFJyBQpIP0D2mV52IpdmiHxSHFblwnfOOcGCllL
         Vx6ojvnRiftGdsBzA6nULK7j6kslBFvMBjlzna7uQW91+dMl2Jis8aaHYkEMWSTU6xcl
         T9+2TglB3CKoc5mO/HgDaVCO/JvgtIVa/HFpzD+e6vih36CySWblXmmx0uQNRGn7EjQn
         r6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681959; x=1796286759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzjJUYtJq/00jKf5atGKZJsY/VwF/Fx8FYMZJrmIn00=;
        b=aWgqqvAKDlD9mo/ZrrSlrTfF1HImn7WtLBmQE9VKKoRGnlYRv213QlE4c+hK0/0TzT
         iBWiXBrJEppLvEFDdr0Jx+sL2Jxw8KV/T/WsAMKL4h9AK/x3v94nvnhNbVcvsLKTbym5
         ahFTex39djgAh3ziWREKqMGGV+SKiJ2cF0eoHghDnogxY/rEnC+L3onmy4T+DFf/tEEZ
         P3KdYTpGwvxpKGeuMLQ7NHTPnjHErNDXVYvCZMPeb4RpfCZapvxbDty9r3jVkCgfrR4E
         0+MkVsdzI18HBAUdbE7CeedkgJj490u//+3++yo/wartbgGkXx75CKssmfnRs6Q/lYO3
         8rrw==
X-Forwarded-Encrypted: i=1; AL+hErETd86+pwPJlgUBRHOQMc25YHDO1IoJyaR3MtwDKUG1pAsG1YUq0r/Nhqh2AGg6EVvCJHgGRgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sYwi4hbOn6fddVOzJsy/HDh2T32P97LWXzrhcBLXvIPQoIauK
	J0yWlBZZv9Zu2t+fyXt0BdTNWoKd4oWi4J7zp//KVO9uoKdziw5zApqWM8UIZnogWG8=
X-Gm-Gg: AZFdTZd7cFWXcvvkiocYDb1NQ7w0AKzqXlexKwaYyhUtHu8ejTQfjGMotDCSEXYnkHn
	w4Mhgx/9hPLJAel7m2rFEoHjATf0ayzI+KfkZ7fD+n/DVxuBUvRJhRzTDNFcREsT88bIe9z+Xjt
	dzRKAT2jK9yBQRuPXcNb/CVVTdZietvmGm+Mu6uuNA+g6D+/vQdW2Mv7dMQnKXuocN8KVRyY1Y4
	DDt+xoIb/WmRR/qG8nju39OOYZ9TVSW/JP+VTGkUfOMEWYKW6O8tibdeNxMkzZDdTgM24fxaa2M
	xLTPLC0cK/9VwZgeJ4MpV55FI+29mj1XzftNk+VyP4Ji6ESgyFc28abuO35l1b9wsfrWcynEYTu
	LVsMzW+yUsI/w0gYnV55IReB9hvL+Cv82S7zF1TG4Iahq2D1y4c3sl8Bp/rFXPLhRMnAV+0vM4V
	VvtzYnSgbe22F1aKDJ9IV1WGFDpIemRiimr8hqmk+7SrC+kzUbwSH4sdPBe0mvnBmhzygwPjVMY
	VgWi2K4ZKUWnY00Nrbj340qAfP3lzCp5ZGkfYVSOPItJgSqocvmy8DiCUMenhCbW1ZxkwNscaas
	B5h/RE4g13JZI2AxeACf7eX80m1cjBPpteqQnrwG4/nQZFeIWYAW9i+YNIqCuPb3y+qD9cdYvA=
	=
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr19343527a91.6.1795681958544;
        Thu, 26 Nov 2026 00:32:38 -0800 (PST)
Received: from JIAPENGLIN-MC0.tencent.com ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm13834575a91.4.2026.11.26.00.32.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 00:32:38 -0800 (PST)
From: Lin Jiapeng <ljp1205831794@gmail.com>
To: aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jbenc@redhat.com,
	netdev@vger.kernel.org,
	dev@openvswitch.org
Cc: Lin Jiapeng <jiapenglin@tencent.com>,
	stable@vger.kernel.org,
	TencentOS Corvus AI <corvus@tencent.com>
Subject: [PATCH net] openvswitch: reject negative L2 length in ovs_fragment()
Date: Thu, 26 Nov 2026 16:31:41 +0800
Message-ID: <20261126083218.55429-1-ljp1205831794@gmail.com>
X-Mailer: git-send-email 2.55.0
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

From: Lin Jiapeng <jiapenglin@tencent.com>

ovs_fragment() refragments MPLS packets from their inner network header
and saves the L2 header in a MAX_L2_LEN-byte buffer before fragmenting.

POP_MPLS can leave inner_network_header behind skb->data. The signed
offset is then negative and passes the "> MAX_L2_LEN" check, so
prepare_frag() widens it to 0xfffffffc for memcpy() into l2_data. An
unprivileged user can trigger this on both IPv4 and IPv6 paths. KASAN
reports:
     BUG: KASAN: slab-out-of-bounds in prepare_frag+0x3c2/0x4c0
     Read of size 4294967292 at addr ff110001059cf044 by task
     ovs_frag_trigge/132
     __asan_memcpy+0x23/0x60
     prepare_frag+0x3c2/0x4c0
     ovs_fragment+0x578/0x860

Reject a negative offset together with an oversized one and drop the
packet through OVS_DROP_FRAG_L2_TOO_LONG. Valid offsets are unchanged.

Fixes: c66549ffd666 ("openvswitch: correctly fragment packet with mpls headers")
Cc: stable@vger.kernel.org
Reported-by: TencentOS Corvus AI <corvus@tencent.com>
Signed-off-by: Lin Jiapeng <jiapenglin@tencent.com>
---
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/openvswitch/actions.c b/net/openvswitch/actions.c
index 12e339cbf791..9c19fe8676a7 100644
--- a/net/openvswitch/actions.c
+++ b/net/openvswitch/actions.c
@@ -788,7 +788,8 @@ static void ovs_fragment(struct net *net, struct vport *vport,
 		skb->network_header = skb->inner_network_header;
 	}
 
-	if (skb_network_offset(skb) > MAX_L2_LEN) {
+	if (skb_network_offset(skb) > MAX_L2_LEN ||
+	    skb_network_offset(skb) < 0) {
 		OVS_NLERR(1, "L2 header too long to fragment");
 		reason = OVS_DROP_FRAG_L2_TOO_LONG;
 		goto err;

-- 
2.55.0

