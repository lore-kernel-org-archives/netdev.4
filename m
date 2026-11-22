Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323191;
	b=gqVqV/AxZ9XcxgpFt7D3hD2OqYFul1EZDG1PA0TsdPgurQ4B2OVoydANVFtC6DVD7kr4
	 xwrcoB1mobv9H+y/BCWnyZVjiW/QEHWrfJlcxjPqmmMgJ22mjra+lvcdGkNyFGnrI5ROI
	 9KEEuiwHQ/LYkGQq1f7zgETiEbm0VhRWCeRxWr9mAqZoZUxbzzqHTPchm1Qlcv9Y95SX/
	 /55LvJ5ElAF2tsPFVQb+9+WbvUr41/Id0BglsHd6XkPbIGsWYY15BeFt0QYeOuj/WGgag
	 vWDdefMrb2x/yYelyCsWRsRylojh1nJBc72HRLacMg6aH+XxZl6sdKC6kbYkUrgZ+Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
	b=4ojkyFzevo0JvIJ8z9c7L4gtzsJ4pbAggzJeQKHQQxjV5yOAbTpGf96m6dAhBFOpYfok
	 SnytJsxExpVVyIz146rToQgRdeE6UZKcFuhiyaFomE/RHlYvcSFjg7n4iyn98P8DJmf1L
	 HdhjjgFS3IBIGKT15WOl4v4GPNmKJcNRRDX1Q37CT/pB0hTAcTLAehFnofjbPjH2dNUXe
	 +F+84jfxCmZMaJn/Acd27Vs+VVzMsREj3kEJY7PGAQdfrlDWXMq+rhnsL+W75mebTrdch
	 oFj3L9xa8tR1ZD+O3rQNzoY1mJ3oBfBbzZ/aUgUPNm/U9ibjLyNOSK0/N2ZRh1jm1lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KufALA6w;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027F9606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 04:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 027F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KufALA6w
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869865a304so3656332eec.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 20:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323190; x=1795927990; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
        b=KufALA6wRFrtVpqYSS3Uz9b8K9wRn78NiNO1Xia3Cn20hfTqxcE7bareisQHrIpltF
         XfXNkBcWwBAKYHsWB41WaYLOUSZNAndKBXFc3jKzhjP7wbFLkUNtiKeH+MB6AxX/B47M
         X/rX9czHHT7qqFBI/2SS2E9dsYPwwzU5KzUboyWa66d2SudNF0UTC1qezpLb43YXqQyb
         fLICsUxKerXMz6qx4PbIK3FkP2rphPcTRLugCskXdLyAF7reY8Y1BXnctLGTfEm5uItz
         4wfxA7xjczmt2yoDgrXO90aTlVrDj4EbICfZQCqknXdiaMcK1dZlBQtanr2GIlvYVQ0h
         ZXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323190; x=1795927990;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7rX67+fJl9J+Pa0Y3R1MHHrJYPdQ/dB5tLUZIlFfmY=;
        b=cHE10bx7jLfXcoirnazXs+0lmwzjAR/wAuFRm2/V8KwXamAzTys8ZdamQ09VEwz9QV
         lYyb+mJB3p7phH7uDIsYeHW62Fmp5t7j1XwqUPBbnVQcQ5Q2ZY92OoJ+vMsGzXRBWiw4
         AcB+csZpAEV70E4VSnLv2vZAZ1FXyFAFpx3xHzOYs07f+OO+Ao1UIsMPkrzdzNuNGn03
         gSjNleJUswRbGMMoD9HIB28VYq3tEtlEESKgD6+u3vcd5B6DCZkaOr7pIecInhyNJ7Eq
         JaHKO+CxvL5w0ee1C2bFlXjX6lcGAuDEk4vevftKmhqmA0XV1DgzdDni0Vnc8/wbc2Cl
         1myA==
X-Gm-Message-State: APuU4Z9/81UewbuFO/mmT1r8bIcM0WHVRHOQ8T8q4IpbXPAYE54OpDPL
	DivFKxGXidSyYglAJoiniMkb2010nMHrmx0BrTjqqPYRO9Tem9Fk1BUkq4Z188j7VY5IZDZwGA5
	psliNJkYkQA==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:383:7f56:6996])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:416:b0:356:7ddb:2e54
 with SMTP id 5a478bee46e88-38570f27b33mr8386164eec.29.1795323189687; Sat, 21
 Nov 2026 20:53:09 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:05 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045305.17511-1-irogers@google.com>
Subject: [PATCH net v2] net: marvell: prestera: Fix skb leak on error in prestera_rxtx_xmit()
From: Ian Rogers <irogers@google.com>
To: Elad Nachman <enachman@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

prestera_rxtx_xmit() is invoked directly from prestera_port_xmit(), the
driver's .ndo_start_xmit() callback, whose return type is netdev_tx_t.
When skb_cow_head() or prestera_dsa_build() fails, prestera_rxtx_xmit()
returns NET_XMIT_DROP (0x01) without freeing skb.

Because NET_XMIT_DROP (0x01) is less than NET_XMIT_MASK (0x0f),
dev_xmit_complete() returns true and dev_hard_start_xmit() assumes the
driver has already consumed or freed the skb, leaking the packet buffer.

Free the skb with dev_kfree_skb_any(), increment the core tx_dropped
counter via dev_core_stats_tx_dropped_inc() (so .ndo_get_stats64 reports
the software drop), and return NET_XMIT_DROP.

Found by enabling Clang's -Wassign-enum on an x86_64 allyesconfig build,
with AI coding assistant help to audit the warning and prepare the fix.
Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on Prestera
switch hardware.

Fixes: 501ef3066c89 ("net: marvell: prestera: Add driver for Prestera family ASIC devices")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Keep returning NET_XMIT_DROP at drop_skb and fix the commit message
        description of dev_xmit_complete() / dev_hard_start_xmit() (Elad
        Nachman).
    
    v1: https://lore.kernel.org/r/20261119170354.1509589-1-irogers@google.com

 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index c4ea247d2470..e62378abcffc 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
@@ -817,13 +817,18 @@ netdev_tx_t prestera_rxtx_xmit(struct prestera_port *port, struct sk_buff *skb)
 	dsa.port_num = port->hw_id;
 
 	if (skb_cow_head(skb, PRESTERA_DSA_HLEN) < 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	skb_push(skb, PRESTERA_DSA_HLEN);
 	memmove(skb->data, skb->data + PRESTERA_DSA_HLEN, 2 * ETH_ALEN);
 
 	if (prestera_dsa_build(&dsa, skb->data + 2 * ETH_ALEN) != 0)
-		return NET_XMIT_DROP;
+		goto drop_skb;
 
 	return prestera_sdma_xmit(&port->sw->rxtx->sdma, skb);
+
+drop_skb:
+	dev_kfree_skb_any(skb);
+	dev_core_stats_tx_dropped_inc(port->dev);
+	return NET_XMIT_DROP;
 }
-- 
2.56.1.750.gf70dc682cf-goog

