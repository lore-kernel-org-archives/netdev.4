Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555165;
	b=Ijf1iqeP16JG6WZaoKyAkrziSe54eK3VN9JHyN68yIJTWIwmUyY79aNgpDhNVKvsrwrr
	 qYDmBgP4f/H3GKkS1RXk571tg8v7aNitxt6QnisEHCgcePzo5vET/s5rgf+J5P5boosLn
	 gwe6ma55w2Pbzlwoj+tQnAkLf4csnMnkcqVAXPzOAIeTC44zwOH651ypWFR8xYL4s4KnE
	 fyH6RzY7JKeNUWPmChTwOYzdfVSLnZMwBZJMqXJxNNj3zVVqj28w0/TKZoQFSW8/RKHXR
	 2Fd364bE8xmHPErrYiaO0jJO9rFcCZB/XdpES1CqdRl4hT2ujWEjV85YuQRVHZxOIzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=gqDtweM2cW1chzCWxN04CalCgw70Vthc7pUT1xxEs1c=;
	b=b9rBQHD76ktJMHlKNd7zpwpSmhIzuSojt351uZVFUeZLG3ihH6CCiz+S8id/3dliw4rl
	 PdPQL+kIfo09JrXN8lecBfD/0OksAoZOgCUU4chwsTNPWpwETXO1mCU9+Ov9clLHUdK/w
	 i5cKFSU8tFDiU7lCK6PaJqjBxsKCxcU4yKtNg8IvSXNNZvLVnWSlvAR4mAdPvozLo5v3d
	 dyFz42Np9Ct46c9+SkYRO8TlSCGXwMAnb9ccK9lkAIIMzfgG4C3jGdtqzaYk4HmGD7tjJ
	 ahF8TbjD9Fm2jF5m1UL+y7t5/fzEYy59jXBXfAjRzIARRYNoOh30tvN543N6RQ6i78g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--yuxiaozhang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DeXNo05A;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A19606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A19606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuxiaozhang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DeXNo05A
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so5402697c88.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555163; x=1796159963; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gqDtweM2cW1chzCWxN04CalCgw70Vthc7pUT1xxEs1c=;
        b=DeXNo05AbBQMsng7Jiltalh0UDYkS9vtL8gGRJwH49JuknfQKQ+MYGRujlX+9xFvYp
         MTYZ4Ujd0TcyVh8Vb9ryhmqqQ16vLiHARbuZ9h8XRB15MoxdYDAAzvLNI1vcTru7fclO
         Qit7F6IQcJzuR3tdLZRG3VaDyoyYIWAYqS1jFA2FSVV2MtaqDhQXLrTtMLRlCofU/Xdk
         dWF84igD107DgLOTDEHO+jhn5bijskncxl6ff/505l7/d4kM0kvfp9luTjYxjQTG8yzm
         cgQqgUisqhC88rfEy0cuakqQEWwwDiGi62+P5f1W38XwLS8ubl6tSVMSkbSXrawJw2zL
         1brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555163; x=1796159963;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqDtweM2cW1chzCWxN04CalCgw70Vthc7pUT1xxEs1c=;
        b=VzxVQJRqe+PeVoIEJ45Zn3EnC1gzN16JDlNfO4jbQ0214/6UtYNZIADedNd+adf12P
         V/AUAwunxrU3ltVmEkMrmPGBO9fN/Nay7U5o8HY/IOud6GP2KXY1cca0LHOc3SDjGme4
         vr3aN3/iR9TCgMwcno+wOfBPlX+7A1PZJL9PTUdtoF1DEqmXHdLTawjJyMFZEEVyQSC9
         ya5e7fm8W23GR3uB+CnEt8tY72rOpuDeuZBEp+HjKyn362gvfjCNwHWbRu5tmmeoxg7v
         N6dN0LWL+w3yeivDXwGcQj5fAFkIQ5f6YEBEKidUU3WUHwOfuUTarWUQ2R04Z7GK2gg0
         1JQA==
X-Forwarded-Encrypted: i=1; AL+hErGhcas8mZC05xy92rYkbh05vWnwxa6dO4gsdMP6/ePq/1+7CtXKg6KGC50v0Z0SzSBkmvMoo2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eY9qRg+71BmiQ14aUfNbPYW6nXsx58y/XPWJktAR1DDKyxNnZ
	RzDaeIvRn4twqhNKz0bTIHcvGcW+4fARxtbMynRFrjdulzbRalqhohu8sy/Rz3Hn6A35Y+qZI3N
	UdtxI4Oj9WJTO8DDyNMGZYuKYQg==
X-Received: from dybpi11.prod.google.com ([2002:a05:7301:420b:b0:342:c2e6:20f7])
 (user=yuxiaozhang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:ea26:b0:1b5:58e:b547 with SMTP id a92af1059eb24-1b5568aa9admr18411479c88.22.1795555162525;
 Tue, 24 Nov 2026 13:19:22 -0800 (PST)
Date: Tue, 24 Nov 2026 13:18:30 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261124211830.3298822-1-yuxiaozhang@google.com>
Subject: [PATCH net] net/ncsi: validate GMCMA address_count against packet length
From: Yuxiao Zhang <yuxiaozhang@google.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Paul Fertser <fercerpav@gmail.com>, Simon Horman <horms@kernel.org>, 
	Peter Delevoryas <peter@pjd.dev>, Patrick Williams <patrick@stwcx.xyz>, netdev@vger.kernel.org, 
	Yuxiao Zhang <yuxiaozhang@google.com>
Content-Type: text/plain; charset="UTF-8"

ncsi_rsp_handler_gmcma() iterates up to rsp->address_count (a u8 field
from the network packet, up to 255) over rsp->addresses[] and logs each
6-byte entry without verifying that the NC-SI payload length or the
received skb actually holds the fixed GMCMA response header and all
advertised MAC addresses.

A malformed or malicious NC-SI Get MC MAC Address response with a small
payload or short skb and a large address_count (up to 0xff, indexing up
to 1530 bytes past addresses[]) triggers a slab out-of-bounds read and
leaks adjacent kernel heap memory into dmesg via netdev_info(), or reads
trailing Ethernet padding as provisioned MAC addresses.

Unshare the skb with skb_share_check() in ncsi_rcv_rsp() before handlers
can call pskb_may_pull(), use nrh->type instead of the potentially stale
hdr pointer for logging after nrh->handler(), ensure the fixed GMCMA
header is pulled before reading address_count, verify that both the NC-SI
payload length and the skb cover all address_count * ETH_ALEN bytes, and
re-fetch rsp after pskb_may_pull().

Fixes: b8291cf3d118 ("net/ncsi: Add NC-SI 1.2 Get MC MAC Address command")
Signed-off-by: Yuxiao Zhang <yuxiaozhang@google.com>
---
 net/ncsi/ncsi-rsp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 33921dc169e3..df915fdbbf27 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -1085,8 +1085,19 @@ static int ncsi_rsp_handler_gmcma(struct ncsi_request *nr)
 	struct sockaddr_storage *saddr = &ndp->pending_mac;
 	struct net_device *ndev = ndp->ndev.dev;
 	struct ncsi_rsp_gmcma_pkt *rsp;
+	size_t hdr_len, needed;
 	int i;
 
+	hdr_len = offsetof(struct ncsi_rsp_gmcma_pkt, addresses);
+	if (!pskb_may_pull(nr->rsp, hdr_len))
+		return -EINVAL;
+
+	rsp = (struct ncsi_rsp_gmcma_pkt *)skb_network_header(nr->rsp);
+	needed = hdr_len + (size_t)rsp->address_count * ETH_ALEN;
+	if (ntohs(rsp->rsp.common.length) < needed - sizeof(struct ncsi_pkt_hdr) ||
+	    !pskb_may_pull(nr->rsp, needed))
+		return -EINVAL;
+
 	rsp = (struct ncsi_rsp_gmcma_pkt *)skb_network_header(nr->rsp);
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 
@@ -1174,6 +1185,10 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 		goto err_free_skb;
 	}
 
+	skb = skb_share_check(skb, GFP_ATOMIC);
+	if (!skb)
+		return -ENOMEM;
+
 	/* Check if it is AEN packet */
 	hdr = (struct ncsi_pkt_hdr *)skb_network_header(skb);
 	if (hdr->type == NCSI_PKT_AEN)
@@ -1243,7 +1258,7 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 	if (ret)
 		netdev_err(ndp->ndev.dev,
 			   "NCSI: Handler for packet type 0x%x returned %d\n",
-			   hdr->type, ret);
+			   nrh->type, ret);
 
 out_netlink:
 	if (nr->flags == NCSI_REQ_FLAG_NETLINK_DRIVEN) {
@@ -1251,7 +1266,7 @@ int ncsi_rcv_rsp(struct sk_buff *skb, struct net_device *dev,
 		if (ret) {
 			netdev_err(ndp->ndev.dev,
 				   "NCSI: Netlink handler for packet type 0x%x returned %d\n",
-				   hdr->type, ret);
+				   nrh->type, ret);
 		}
 	}
 

base-commit: 4392bb809812ac79449cd0cf1f5e00469ee102d1
-- 
2.56.1.809.ga0b61035b5-goog

