Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777442;
	b=Axqyr+vMj3KnHdgG8FRsY0M0YtEe7WAHa5CRBviN4MNqJd+0aK/JexwfQQ1sPRPgFfRL
	 VkLV2N0A+ji+aiaF79fev6q0ZZPTkj+z76btXQ/hyP5geKkXmnZsCXxuu/1JlXpZp8EFG
	 tMJikcTZkdhMIUVcuwYMrDXQyf3rt725x/7/YLwb1XaJI/QcChZd0krfifrf8iqWJebxW
	 WocXhzQ5ySy7cN75j88f3VNUawNPZ2vBD7bWzbM6+riXRlvkynxkiX5IRg5RO9CxiRQ/T
	 KfSWYSRdM1yJZMBidM61TdjEZV//eeK9+XLbu4g/EMswUsTcO8S0DUav5K0W+6qR9bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
	b=aMhwlEYIXIxfamyfuuwwlqsViw72/r5AdKq+emRc+SGgrg06psqNoaUW1NOqhZUDLFta
	 Kq65eFYMDjk4O/FARm0q/mlw3ZPjtHhNLJIeMemWXxQvvXHI4sDk+kOUze/WS01PHZzfs
	 C1i+8zaiknJ+zVr2uLeowSWCdj8VrbnkJXBRTQy+WDFkcRTxjk0XdYB+vpSpP8aDCAE6k
	 WUPfP3GhIdjXPDJb89H0w04RuicLpb6R0IIf3ixD44/f2U0g3mlUckc2AzIRo8+jKGslP
	 x2cDaoRzQxOtt6g4SSH+TsaKVF9rPo4nGSmpgNhzSE+ClYvRI5boed21QexEn4kBmQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=UQZiU34F;
	arc=none smtp.remote-ip=74.125.82.97
Received: from mail-dl1-f97.google.com (mail-dl1-f97.google.com [74.125.82.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1946606A31F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1946606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=UQZiU34F
Received: by mail-dl1-f97.google.com with SMTP id a92af1059eb24-1a3c08d6928so11863020c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795777441; x=1796382241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
        b=UQZiU34Fa3WLoJfrLE6309naeCq7IO6zuC2AP3eyTRT/oykAOoZnS7dTa0QKRzG1bX
         GxHACPHIO5DVgnHtS4+xk4RereDUpW2PImoxHBUamW2UcE75t3wx8KQ0bDSXgnQOHBHr
         E8tzrc69cZDRExukvNvh9gkSmy2h6YL9dwfgPVOkKsQpFCB6GWFr6b0V4P5uQEUWty+4
         4lqroT0ADML6YOXMgpC1kueW2UvPa90u/nLXAJCvjY11kp9Z+h09dXi4ooaGWjDl4JfU
         FTxgtKmrY+MwOyq8zhWZ92NzvWAEivE400c406O6Z7i/fOQTIRdhC+s1JTAq3n+Bdx8q
         UyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777441; x=1796382241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sBbKLTeMth/78J0FzA5MVCClolXP++to0y+7e0RapHo=;
        b=acw2NVY67n9YBEhT38/hB6DP4vfvg40DnsVNL7WkGCYJ85p4TElfstlsa9ttZLoijD
         nBM8/+8xdDyO7Rw1gz0u6+DzSXD9aAZ2v4nC+hgZX7j0kdt74pUa5gFxtmiJnL/wjY/0
         1/UapYNDumx9qtUHM14Mlc+IAH3PZFISpW+x0MkF3SwggZLwE/mxFey5lG4geXBFQzrP
         rVotrPr67LHYOgv7vLhAjXywNQqU+z+VUZK1MpTFubHGzTU9UsoD2Eudlkub5JwwG9W1
         iqxl260ajKmWOL7ogte9rfPLX77VlFqlZNjCpDkV4Gw+HH/Or/kBd8h4y8lKnjgrtvwV
         evUw==
X-Forwarded-Encrypted: i=1; AL+hErHYhbaVOVDO2atF89LLvYkCw6QTjgHTAzmeW8ifyOXa+EXV2UL0eXkALLHxvCqrGSvSA8ZqDt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ysBNMy7I+mW7RgqO4vuGDWTbFIv05kPFceDAo8TATGqPirDnh
	krOUI8nHGAOdhbU3Bcof2vyPSfs8NIn228QNNo7OqWSTzuo901lWRVc1BIsth5eTMX9fGPKJxCy
	XU1gWhvdgN2mE990+tlo0p/Ho53g7erMS3q7JWFcciNtvQvTkQwQS
X-Gm-Gg: AZFdTZcih3TCA4RcQMZNon3rtzgWfXVId3NTlCslauMIAolG3yNjOlZxqs/3Gtph6g0
	9zZh+9DTpNMvKtOiX3TBZqntqfibeeDn6n8+/SSvr5j06OCXdfh/nKjYEXqrs2PeY5/6Gm0pDg4
	7mGDElYf52/vze8YBSwLd2uitTGX8YMn4X5mqZtkpDb446hSTdjnFu0xXdsxisOsycgcSPtKVju
	emVsxtC74tKGa9JBiwiDq4jmUCsYW/py8pxOUTfFO+COP57JaERz+cydoO8xlWnFoYYLnwW66yl
	6TGqb4fmwTuGGm3dzUUReWe1r45RJH8QH0hsn6xw2V6CDFIp+HOLb6xiX82vJ4DuC7BH+Q7W6W0
	6wQP5bhCSjnMnGRKbkuzXAbyiGnU=
X-Received: by 2002:a05:7300:ce8f:b0:375:7be3:1bbd with SMTP id 5a478bee46e88-38570b336f4mr21662778eec.23.1795777440698;
        Fri, 27 Nov 2026 03:04:00 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385677c0c07sm3922451eec.19.2026.11.27.03.03.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 03:04:00 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH ipsec] xfrm: iptfs: reserve room for the outer MAC header in new inner skbs
Date: Fri, 27 Nov 2026 03:03:55 -0800
Message-ID: <a502a95c-de83-4f8d-986e-80f804ebe76c@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

__input_process_payload() copies outer MAC headers into skbs with up
to 80 bytes of headroom. Longer headers (NBMA GRE) wrap the 16-bit
offset, and the copy lands far past skb->head; reserve room for mac_len.

  BUG: KASAN: slab-use-after-free in __input_process_payload.isra.0+0x51c/0x1c70

The patch was written with an AI coding assistant and reviewed by the
submitter.

Fixes: 6c82d2433671 ("xfrm: iptfs: add basic receive packet (tunnel egress) handling")
Link: https://lore.kernel.org/netdev/179524501671.3135.15869590714107061136@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
netdev's AI review of Piyus Kedia's "xfrm: do not write the ethernet
header when the mac header is unset" pointed out this write (Link:
above). 7a505bb0168a ("net: clear skb->mac_len in
skb_unset_mac_header()") does not cover it: here the MAC header is set.

Found independently by an AI code review agent. Reproduced on ipsec
master without kernel changes or fault injection. With this patch the
reproducer passes, two boots each way, with panic_on_warn=1 and no
KASAN report. A reproducer is available to the maintainers on request.
Not tested: an architecture where L1_CACHE_BYTES is larger than 64.

 net/xfrm/xfrm_iptfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 3fff835497b9..fe54979116de 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -242,7 +242,9 @@ static u64 __esp_seq(struct sk_buff *skb)
  *
  * When @l3resv is false, resv is XFRM_IPTFS_MIN_L2HEADROOM which arranges for
  * `skb->data - 16`  which is a good guess for good cache alignment (placing the
- * to be pushed L2 header at the start of a cacheline.
+ * to be pushed L2 header at the start of a cacheline. If @tpl's MAC header
+ * is longer, as with NBMA GRE, resv is its length rounded up, so the
+ * arrangement holds: it is copied in front of the inner packet.
  *
  * Otherwise, @l3resv is true and resv is set to the correct reserved space for
  * dst->dev plus the calculated L3 overhead for the xfrm dst or
@@ -263,6 +265,11 @@ static struct sk_buff *iptfs_alloc_skb(struct sk_buff *tpl, u32 len, bool l3resv
 
 	if (!l3resv) {
 		resv = XFRM_IPTFS_MIN_L2HEADROOM;
+		/* A longer MAC header needs room too; round up to keep
+		 * the cacheline arrangement.
+		 */
+		if (unlikely(tpl->mac_len > resv))
+			resv += ALIGN(tpl->mac_len - resv, L1_CACHE_BYTES);
 	} else {
 		struct dst_entry *dst = skb_dst(tpl);
 

base-commit: 2803867cf3defa294710088a4663b434e12b5e93
-- 
2.53.0

