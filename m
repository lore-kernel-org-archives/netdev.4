Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863407;
	b=X8B8a07PnkaUXkogwh1m28hPToKdGncnQt7rghHLvkR5KJcpsgUiRFKW9jKzdl4ahzED
	 NQu9qnshcjUUdA1ZbZBgLa8e+EWaRu8k4/7mOH3mmt783fZnRipIIUqZRxpAPmB8yvznU
	 u3GifjEtP7HId4cD+1YbGQIJaPlHI9ulHwuXPTq8S8GXW0uUi0Kl2I+JwaJd+iWSu7rZk
	 OhrY1SoR5wlG1n5O+jjjz0EmD7JvbiB1F+phWcgYdVcrxcac+CaTkLHjVc2Jxxbav8t6q
	 GcHsm6WFG0RaUfZZrr9OCbJPE7YQB2+07MRrwERdzltUDE3nUmvc1ijNGKFQWF3tVtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863407;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=JKAZYXMdZqe4nxfssXO4EK9O/cr+JRVGzs2YOMELCDw=;
	b=CwaoT+Qv8ca+D1UIUgDITAkRcTqBPWPLuUzd4PEqOf9/yAejq4OL0A8ByAsNE/dVDsiN
	 kDeGt0Cb2uG4UKBkNvoqfFtkv9rFeKgxKnP80o7R634Ihmmat9X6XcDzEcr0cmE+6y5Tx
	 DAenhdOyRSKFHUvzOe+vLP1iKDql9tmbCsW/OqpsyBwr28mCQvO3fPQzD+jmy4W+IydkC
	 RlHGRcIIQwL8KsOd1sCiMxE0n3Lj9G1XFMtzdExdWJdmzi7RqSAOlr20HY5o1tBj9vzXl
	 BlkwT/6IG0BTwC6RQD+X4GJd8Vl3LrMgPwfXWv3aN40WywezPeN+Uhhm3ju4VvAovdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="NWJp/cfq";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE62F60A262D
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE62F60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NWJp/cfq
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so2487681a91.3
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863406; x=1795468206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKAZYXMdZqe4nxfssXO4EK9O/cr+JRVGzs2YOMELCDw=;
        b=FJHJsU4V4coMjJjtaFzD2BFnxnePZj2pQYrX48OFvAGf6mNO1HnX5bUI+j9YjoDv9e
         welkyE+U4dXfrFZ0FG1aiyHgezSqOYGlquoaLONQqPLVdjL7CBnlRLPYO1gUYmdecQy5
         6RwDLIw7TASwTuph1fhSMwry+0v7C+brzTOADa56w/ozgYyJT35W6I0IHlnFeIPn0y7u
         jEJUEk0eKsdxi5NgNBS1WYiqdLNwjHQPZPdDzLoIf2IV/tKKtYoEQrgf4K3GvdYHlDI3
         ZP8tKUOxOBilizCjQ5c0RD3zCrNASCYEjW+mEwiAGOIdmHI8EfRv3rz1klB8YWvKImZj
         r3OA==
X-Gm-Message-State: APuU4Z/YKxOLYZnKpDvhWXdh+KCjIhF9+BqYzLQ0HcGseKTcM5BeqkA5
	hsb3EVPe6IvOQQ4J7WskgpxOJDouPwmTHG3YVRbGeJyU5d2PVfoSuh5jSnFe9DWzizuu0YGORhh
	TdpT1Y7olNwZLoXYbejIZdEYpsiwSfn2L0GhO+cfPEwhL+bikZSwuHunEGy2hquOa6QicmeR7z5
	J0RmM0wsdCOxS12yXyXYk97Nn+AMhEK+UfLd7sYBpP4006tzKAtvqTYVrthUahaONhbCla1U1BJ
	dcvjMLtuEL3Jamm
X-Gm-Gg: AZFdTZeTl04AkaO0UpkX4LXBEssmw/rZ0fVYD3iJjtPZLmKGurjPpkkrR2Aj2wmATSi
	tREfoBgp7jOIM+Ltf872+nbiKehapVzbHiF/8TUTtl92zBa78lkLJQR0TL4tEZV4PxSTV4QTB7y
	9LQxqZsYlnqGILWn4Qe6x9oiUttvdpVxlNAFM1oUfpb2KkTd819WLsAB441ybmqXzVrADV4Y4qv
	MJHEeXDOnYQJkM8pPsu8SumPNWNhIUlLQIKYcuFpyl6WEyKNqw5cJsavhbT7JKKZ5Ea24ARwDWi
	eR/wpVvJU9iZ2o5Kfh2mRYjTwSDxbhzUQGPoexUPLEZ9bRuCh4GlvYHwPXKDiV3tM+lT/LHz/Jd
	7SPKEiw9E55EgUdt6/6i0r8KUbBo8husQqaScrrsANuEPpkHfLDiQ5Bmi9KC7orKUijI6nbH2pa
	wFUa+qK7/Kv5CHZ3PXZwJDwSy8iGiRb4wNmgJxMHyx46Q=
X-Received: by 2002:a17:90b:3d81:b0:3b3:a6b0:8991 with SMTP id 98e67ed59e1d1-3b3a6b08a53mr1380685a91.60.1794863406190;
        Mon, 16 Nov 2026 13:10:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb84cacsm408968a91.1.2026.11.16.13.10.05
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:10:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-920fb8b9859so8867246d6.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794863405; x=1795468205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKAZYXMdZqe4nxfssXO4EK9O/cr+JRVGzs2YOMELCDw=;
        b=NWJp/cfqhbhA2oH01EqFEVibXqacDgK7lmVt07WNL75ee0XBd79w2TrGCH1CtD/A9R
         oJe/VEkuFm7+t+Yns6nLqz+IsbCr1bA6/P9U64klL6d7NgQd3wr9/JYCD+8A2KQw4ZG3
         B3qPZrcyCKp5HJ1RHZ/wkLSeF+5Lknmcx7pw8=
X-Received: by 2002:ad4:5e8e:0:b0:912:517b:20df with SMTP id 6a1803df08f44-91f242627a8mr174689156d6.39.1794863404995;
        Mon, 16 Nov 2026 13:10:04 -0800 (PST)
X-Received: by 2002:ad4:5e8e:0:b0:912:517b:20df with SMTP id 6a1803df08f44-91f242627a8mr174688376d6.39.1794863404364;
        Mon, 16 Nov 2026 13:10:04 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-920fe17eaaesm3601396d6.33.2026.11.16.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:10:03 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net v6 8/8] net: dsa: b53: fix mirror port encoding on BCM5325 and BCM5365
Date: Mon, 16 Nov 2026 13:09:42 -0800
Message-ID: <20261116210943.1352656-9-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
References: <20261116210943.1352656-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BCM5325 and BCM5365 use an 11-bit bitmap for the mirror capture port,
whereas newer switches use a four-bit port ID. Programming the port
number directly can select no destination or the wrong destination, and
can select multiple destinations. For example, port 2 requires BIT(2),
but writing 2 selects port 1 instead.

Use the bitmap encoding on BCM5325 and BCM5365, including translating
logical CPU port 5 to hardware bit 8. Apply the corresponding field mask
when checking for a conflicting destination, replacing the destination,
and clearing it after the last mirror source is removed. Keep the port ID
encoding for newer switches.

The ingress and egress mirror source masks use the same layout on these
switches, with the CPU port at bit 8 and bits 5-7 reserved, so apply the
same translation when setting and clearing a source port bit.

Fixes: ed3af5fd08eb ("net: dsa: b53: Add support for port mirroring")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/dsa/b53/b53_common.c | 46 +++++++++++++++++++++++++-------
 drivers/net/dsa/b53/b53_regs.h   |  1 +
 2 files changed, 38 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
index deb331b3629a..ee2d27732c0c 100644
--- a/drivers/net/dsa/b53/b53_common.c
+++ b/drivers/net/dsa/b53/b53_common.c
@@ -2608,6 +2608,31 @@ enum dsa_tag_protocol b53_get_tag_protocol(struct dsa_switch *ds, int port,
 }
 EXPORT_SYMBOL(b53_get_tag_protocol);
 
+static u16 b53_mirror_capture_port_mask(struct b53_device *dev)
+{
+	if (is5325(dev) || is5365(dev))
+		return CAP_PORT_MASK_25;
+
+	return CAP_PORT_MASK;
+}
+
+static u16 b53_mirror_port_mask(struct b53_device *dev, int port)
+{
+	/* These switches use a bitmap with the CPU port at bit 8. */
+	if ((is5325(dev) || is5365(dev)) && port == B53_CPU_PORT_25)
+		port = B53_CPU_PORT;
+
+	return BIT(port);
+}
+
+static u16 b53_mirror_capture_port(struct b53_device *dev, int port)
+{
+	if (is5325(dev) || is5365(dev))
+		return b53_mirror_port_mask(dev, port);
+
+	return port;
+}
+
 int b53_mirror_init(struct dsa_switch *ds)
 {
 	struct b53_device *dev = ds->priv;
@@ -2631,15 +2656,15 @@ int b53_mirror_init(struct dsa_switch *ds)
 	/* DSA retains matchall filters across suspend and resume. */
 	for (port = 0; port < dev->num_ports; port++) {
 		if (dev->ports[port].mirror_count[true])
-			ingress |= BIT(port);
+			ingress |= b53_mirror_port_mask(dev, port);
 		if (dev->ports[port].mirror_count[false])
-			egress |= BIT(port);
+			egress |= b53_mirror_port_mask(dev, port);
 	}
 
 	if (!(ingress | egress))
 		return 0;
 
-	cap_ctl = MIRROR_EN | dev->mirror_port;
+	cap_ctl = MIRROR_EN | b53_mirror_capture_port(dev, dev->mirror_port);
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 	if (ret)
 		return ret;
@@ -2659,6 +2684,8 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	struct b53_device *dev = ds->priv;
 	unsigned int *mirror_count = &dev->ports[port].mirror_count[ingress];
 	u16 reg, other_reg, loc, other_loc, cap_ctl;
+	u16 cap_mask = b53_mirror_capture_port_mask(dev);
+	u16 cap_port = b53_mirror_capture_port(dev, mirror->to_local_port);
 	int ret;
 
 	loc = ingress ? B53_IG_MIR_CTL : B53_EG_MIR_CTL;
@@ -2677,7 +2704,7 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 		return ret;
 
 	if (((reg | other_reg) & MIRROR_MASK) &&
-	    (cap_ctl & CAP_PORT_MASK) != mirror->to_local_port) {
+	    (cap_ctl & cap_mask) != cap_port) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "Only one mirroring destination is supported");
 		return -EOPNOTSUPP;
@@ -2689,14 +2716,15 @@ int b53_mirror_add(struct dsa_switch *ds, int port,
 	}
 
 	/* Select the destination before enabling the new source. */
-	cap_ctl &= ~CAP_PORT_MASK;
-	cap_ctl |= mirror->to_local_port;
+	cap_ctl &= ~cap_mask;
+	cap_ctl |= cap_port;
 	cap_ctl |= MIRROR_EN;
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, cap_ctl);
 	if (ret)
 		return ret;
 
-	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg | BIT(port));
+	ret = b53_write16(dev, B53_MGMT_PAGE, loc,
+			  reg | b53_mirror_port_mask(dev, port));
 	if (ret)
 		return ret;
 
@@ -2730,7 +2758,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (ret)
 		goto err;
 
-	reg &= ~BIT(port);
+	reg &= ~b53_mirror_port_mask(dev, port);
 	ret = b53_write16(dev, B53_MGMT_PAGE, loc, reg);
 	if (ret)
 		goto err;
@@ -2749,7 +2777,7 @@ void b53_mirror_del(struct dsa_switch *ds, int port,
 	if (ret)
 		goto err;
 
-	reg &= ~(MIRROR_EN | CAP_PORT_MASK);
+	reg &= ~(MIRROR_EN | b53_mirror_capture_port_mask(dev));
 	ret = b53_write16(dev, B53_MGMT_PAGE, B53_MIR_CAP_CTL, reg);
 	if (ret)
 		goto err;
diff --git a/drivers/net/dsa/b53/b53_regs.h b/drivers/net/dsa/b53/b53_regs.h
index cfdb5ed38326..ee049927a63a 100644
--- a/drivers/net/dsa/b53/b53_regs.h
+++ b/drivers/net/dsa/b53/b53_regs.h
@@ -239,6 +239,7 @@
 /* Mirror capture control register (16 bit) */
 #define B53_MIR_CAP_CTL			0x10
 #define  CAP_PORT_MASK			0xf
+#define  CAP_PORT_MASK_25		0x7ff
 #define  BLK_NOT_MIR			BIT(14)
 #define  MIRROR_EN			BIT(15)
 
-- 
2.53.0

