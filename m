Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795651925;
	b=ioOU+u4zv3Ej2WC/Cq00BxSrSnXYNx0GJtw/qsdIxS2UePU4oMcElu60XqSdQLjVGNtn
	 HIah54SgauRMxOscdXRqBImHKXz7KoPVCzJtO/CJt7jnGMgoPy1h/abTbldZhsP/Q5P/Y
	 AgaGA+GMkh8C13RT8CVyXb+9qCU1nRKd4T6SGbB+OsItPEqUfzdsqGMrK4doTnamL8dFc
	 JTquAW35FoX3gKUDtRjk4nA5xAdAKdeu5RB/l2OXcUiG4a0yg7EXGPufjBYndG+jCWHDi
	 LA7GM2zwzAykP6xC+4a5ivj249BILmM97EZ+sssGn04Ne21Vw3O+uc+0u7U4rF4eCXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795651925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eh53HWlWeYqc22pkcThqRd+K0CvliST0uP4BTE7Y98w=;
	b=2gLtFyieMk8eKhe7GVhh5taQUGFS2wVzZBL5/Ltx8U1/uN4JFTtbIh0LhQfDBwdZF3w1
	 25Wg4kJLByQMM6wfVExmnxjppBiQMYgjjwuOZXK1xt0oo4GCEVv7fpA5CzQPwq5KbCMIK
	 XQAf87VSmsQdiCpIZX1b0PWPX0yA3QL6i3i6wwTz87rb07sDd7XQKZNrOfkZ3X1YGaWCx
	 eb3UVkuFKBRQRif1WjWQYMB27z4Xk5gM9zjDhkEmMigVPbLFky9HcsJAsqWExCyM2XSU4
	 PvC0U8OmUhvdzKI/4HgXcVLYD3vipixH28THKDfcau8r+JLswo1WKdYNrV2xmTVgioQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=iTExogPz;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852A5606A329
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 852A5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=iTExogPz
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386bd881d39so5768944eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1795651924; x=1796256724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eh53HWlWeYqc22pkcThqRd+K0CvliST0uP4BTE7Y98w=;
        b=iTExogPzYoZ7KsoxJgwtQ2u6BEwE1zh7gf2BklH+Y6vYmJ6Cv3tVt8olnC9ccSXNv+
         IWLK/+A6tNWMmQJYnu+pg7evH+jWsBjzqJDx3lCRd2/3d9vrNRi7rFu/iMpvkqVmPwqi
         4a8cRe7XlCIxVkruoMUoSoy0SznIgvLBfphNLBYxj5yEATfp2D+zLsUe3QWD1IUtT/65
         5Q8kyLGEDcMZPcYh3mm6GgWgVb+/E2m0ZTv6833pqMrEN0RFzUIoOAuafEbfiV1jswDA
         FoJ4AF01ye2h8hQNqAb2xfL9Pk0zVhW2AMEDKV3iD3f2kyQMPLxGykMB9hGyqlnr5zob
         A+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795651924; x=1796256724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eh53HWlWeYqc22pkcThqRd+K0CvliST0uP4BTE7Y98w=;
        b=LeSvZ6iW3cLwa3bgKsAVLkFsc+x06ziyeGx1JO/POFtKQVdA9g7tyjUtBdY2Y4eocX
         SqSepQtzrdNnWACZlfS3vOIzCR2swNy/3y8dsL9mS3ubSebNTWDQEtMaA4EGtGXw0wqg
         zw8HsiUm7Sf2PEkbkHuQs0tEgp2RoUiNi0OeSOXPKZgpxOuRoPVA08zmplyChdlU0gcZ
         bYhCMg/bVADUfzqWaJlXPCR6gXg+ZTqbxAHQrpF51HC6Xr4Cc64UlOcRQgxOvpWI7Ovs
         rjDblJbsD6Vx4v0CPnIPm44x/IVbz5fIlrSpxpjqV1qMTbXys+JdNLtylYbjgxy0nBFV
         5Wmg==
X-Forwarded-Encrypted: i=1; AL+hErFJ3TEe6hn8dC85sESFIRyuFfCfaCNAEKZk7/CGMA3V2IsC4kNCpobj7GofW3R17pnn4o0zun0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZSUTnmcjMm85LWXfvZuiGvCtYLdxMCfOtCtBSCTBnjMOF8IQs
	qIHkWa5EBs67jq1k0LSM9LBG8RsFPjwUdTw2lJrudvg4/W13OgQ/d3gPQrT3BrVvNA==
X-Gm-Gg: AZFdTZdGxzw75DRAKfwbTjkRAirwPfqfenJ1fwV88VdMqbEAM6eYQH3gja7NdK4DGe+
	oMQUmPp1rEiWXqRFIt065SwwJ1AxshqwVsYv1zhzZMr5jZEXv7rc+VToQGIZ89uGzkCFxse0UkV
	2NgPnfbKEr7fnqPTyZ5YtEkto8mnVGG+X5EGJwmMvzdZl5VSdMtrytm2udMeOwSuOviYHDAsRX+
	WZD0zrXd68t6j0cAb36Dr6GXBWsQkKQT8+Av97FPlIBLs/lOPTR+SAQA2W/8XcPp7NwSKZHITph
	bOYEXEsP1AXNiIjOLwO11mvg3F2WMcDkAKhI1L3Yd1tWxmr1R8lTGGLvCsF2tzzuODQrkP05fHJ
	1kzSXQIvyyB42AFH5AAQV1hVgHwG6WNfwtUL/nr5OjTHjBAquM8dkqcc/fPerWyvqHpC9P6SEuC
	LCamfkKaXWmKPUwmNQROm1OtnNP3ObW6qQJHXwz4/FI7TqKye4vQYxV5ztbKbz1gKrBjtS8ZXGU
	oJJDJWQtJ5yQ0GUmbvPuc4XbNPIpX9Csw6jN34DdzcVQ8w7rGaRRANT1oMO1GW4OzcK7M1zIRFa
	WRiHfuVlT9zci66d1ttPoobSQZhJ2eG0QVHSYZgidUAzEhw4is96GIaNW2ZBlA6aXSsz
X-Received: by 2002:a05:7300:f789:b0:386:abe8:32b0 with SMTP id 5a478bee46e88-386abe835b7mr12918966eec.8.1795651923427;
        Wed, 25 Nov 2026 16:12:03 -0800 (PST)
Received: from p1.. (209-147-138-4.nat.asu.edu. [209.147.138.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm26216299eec.27.2026.11.25.16.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:12:02 -0800 (PST)
From: Xiang Mei <xmei5@asu.edu>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	co+85229ab197510ca7@bugs.sh,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH nf] netfilter: nft_exthdr: pull the IPv6 header before ipv6_find_hdr()
Date: Wed, 25 Nov 2026 17:11:51 -0700
Message-ID: <20261126001151.13793-1-xmei5@asu.edu>
X-Mailer: git-send-email 2.43.0
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

nft_exthdr_ipv6_eval() checks only skb->protocol before calling
ipv6_find_hdr(), whose prologue reads ipv6_hdr(skb)->nexthdr from the
linear area without a pull. The expression is usable from every family,
and the netdev ingress hook does not normalise the skb: an 18-byte
802.1Q frame with an ETH_P_IPV6 inner type has no IPv6 header, so the
read lands past skb_tail_pointer(), and an AF_PACKET frame larger than a
page leaves the header in frags, so it lands past skb_headlen(). With
NFT_EXTHDR_F_PRESENT, it decides the result, and 256 "exthdr ipv6 type=T
exists counter" rules hand it to an unprivileged user running in its own
user and network namespace.

Raising the device headroom puts the skb head in kmalloc-1k. With freed
struct net_bridge_port objects sprayed under it, a uid 1000 run on
current mainline read back kernel-written data, byte 2 of
WORK_STRUCT_NO_POOL in query_queue_work.data, and bits 16..23 of the
query_queue.prev self-pointer, i.e. of direct-map heap addresses:

  read offset 570 = byte 2 of the 8-byte slot at 568
    freed net_bridge_port (32 probes):
      byte 0xe0 (224): 15/32
  read offset 554 = byte 2 of the 8-byte slot at 552
    freed net_bridge_port (32 probes):
      byte 0x15 ( 21): 2/32
      byte 0x21 ( 33): 2/32
      byte 0x59 ( 89): 1/32
      byte 0xb2 (178): 2/32
      byte 0xc3 (195): 1/32
      byte 0xd8 (216): 2/32
      ...

Pull the header before the call, as act_ct, virtio_net_hdr_to_skb() and
nft_set_pktinfo_ipv6_ingress() already do. For the ipv6 and inet
families ipv6_rcv() has already pulled it, so this is a length check.

Cc: stable@vger.kernel.org
Fixes: 96518518cc41 ("netfilter: add nftables")
Reported-by: co+85229ab197510ca7@bugs.sh
Signed-off-by: Xiang Mei <xmei5@asu.edu>
---
 net/netfilter/nft_exthdr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nft_exthdr.c b/net/netfilter/nft_exthdr.c
index 861bab93f435..a7c2f7553af8 100644
--- a/net/netfilter/nft_exthdr.c
+++ b/net/netfilter/nft_exthdr.c
@@ -52,7 +52,8 @@ static void nft_exthdr_ipv6_eval(const struct nft_expr *expr,
 	unsigned int offset = 0;
 	int err;
 
-	if (pkt->skb->protocol != htons(ETH_P_IPV6))
+	if (pkt->skb->protocol != htons(ETH_P_IPV6) ||
+	    !pskb_network_may_pull(pkt->skb, sizeof(struct ipv6hdr)))
 		goto err;
 
 	err = ipv6_find_hdr(pkt->skb, &offset, priv->type, NULL, NULL);
-- 
2.43.0

