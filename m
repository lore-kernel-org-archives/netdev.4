Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134371;
	b=E8uJALsDqv1aYxNylfWyWI2t3K8dGgbNob31q7lV3Mrlznd0yoeEQRPGRRlqZ3xcnY61
	 nXS/K/rSUvCzk+5y+fPSZ1054YuElG3iSqgwFSMpegq9Mjt7XUmP+h50jKYm8Am0oobp2
	 /rx6TjEdDrP5ngGT8UGFpXaIXSpTcZMzGRt96A+HuzQPB7jGsV4vyHlcRnvWeA99UV9J8
	 EDye/D5Fwt1xp1Nf3oMUFAgmFs6hom18GrNTpARQ//qw93fq03dERw7LVJEC3L8KT9wTj
	 GR1Df7DOEUgXiIqJrp//isiB2+p6yoJPHcPSwT+vm41ol10AkjGCphjj9QjrsG2q5/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=nuX7THCmnLqGa7+74d5AVQr2uRc60xlpjShzdknShgY=;
	b=l0Ew5L0DSh0wdG/uEdsgDKtXx/30S2elBg07mqMIPi8G+ez7mWwkgfPiPSYfsSlOpZd2
	 oUwA+w2X92ELtLB6+nS28EQLgQ/nmKi/Xgjre5Bv5IN1rVntHFu9+dy/2WZ9yJWzJfWC3
	 SY6ejv1iPcLicjmYYgAAK4YWGU9YcpQ39lOR5FAl8miri3DTJ9qM04m8hUsPaZjNl8AZc
	 Q8cJ+hpzXtCeQOp2v9hLKmPkwK9556t5PhjvGlhJijkn8zHwGmcxr41s6/1bqDK1SKamx
	 9sJ63C/j07neq5OlNo3skA6414WDNv/77JRxo0USHVN0nRnFeZKXdaG8b9AqdhwbJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHzM07bY;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F0B606A337
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02F0B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pHzM07bY
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so249550f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134369; x=1795739169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuX7THCmnLqGa7+74d5AVQr2uRc60xlpjShzdknShgY=;
        b=pHzM07bYYYGn5CeLneZvIOorVvK6Rf9k0bjdAQ6X0SbjIKd5irJym8phnYbYlxyWMM
         xV/FnriaQxuGZONNnClFSdnkZN+T7FBpYHnS9Zn/Uwf9KZKiXsKb/4h1KbJIvLNrf6Ty
         b/1aYP5hC6Aj7v6zeSsKt8WexWzpYfgdJonvnQ8Tv9uG68d6x+Fn0o+NeVn9lyxu0zfD
         mDGsz66EbJa4jA15U/yx4+aD/v61LcilNQfuE28rqPA6fBHcDcv1kkMQNEb7i2g9MVJy
         WNZdvZznk4SiMhLwHmOdaRG+YF7ajrwZ1TjMbNaG7kMjXxbbZc15BVpbW56S45SetOdE
         KjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134369; x=1795739169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nuX7THCmnLqGa7+74d5AVQr2uRc60xlpjShzdknShgY=;
        b=PAI6kDvHKSs+6pLmp2UtGpcPm6fbgCNK5rFf3eyz3FWVRuG8pgf7WmS1rFTJ4JWdsZ
         iBj9QtFAbZA5gJV7rWRCerDomHJqItk1b+S0coCWoGk6RH249vPmMV1npiwNMgKefERM
         HNXlEJdiUPIgOB/qvep0rT08WzlShl8+EEfIfFe8UtbmCbty/bGVXYmguKZBFM+XpXrE
         qmz3mqQ9QiWj6pP4ny7sq+10J79UrWEN+5HZv+mEwjwqPron51nqoYfEP1qFv8SLpo4L
         t27VsY9y0v2xevn+jxxkzbX8suwe7kvG69hTyGOBh+J0YNXfKt5fnFaiCKH5aeMZwjE1
         hezA==
X-Forwarded-Encrypted: i=1; AL+hErFr02qRm4Mnvp0OZUJhksGvP4ok10/lADvpIOmmmzF74IEV4LzJfQYSzE7tcX2pZD0tZsFj3Yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rBTK1QT8aY6CtESIbk/8dKxQAXYz3HkXTuKCWayw5gSmhLkQd
	6C99Wqcxuu6elSn98Zd8bAX+cjTQ991lapuxaWKo8dxDYlq+U5bqPnBp
X-Gm-Gg: AZFdTZdCHHLdpmPgMRvHI4oGT8/OwV9Fya/gG8MLFK2QeISR4+wLh35ORSlmy855lD9
	WPkmUV7LmxgUouO60aDbfeubcGsl0uGN1mkArIxTY2suZedU/r4yGWhl9uNMlJUJh6dzVoA874Z
	Jx5JkX1TIASPPhWUyg8ant4QNJ4Da8vdK3wTL/DtMcDscZ54+vLggRIKsJ9kEInJAdagLcAQp4H
	4+MEXm4CRqbRKMvX+tc39meJCkfDT+YnC3DFAWqcwl7qOe1DgsuJLjFc9ZzeqyI9V7O82vglrOD
	LdFU2nkqEUhdAFMeYQ4nSgbaUVQ+f3UQHrw7dgtsBP9mQ0yjX/v9SwvD1EBkEh9j68RjtS0MJHu
	qr8lO4DMIjIUpflARb1Moz3vF58Ii6lHCle3AdyCDoInnKkR9Quh9BVptM9kTVlVZsJ1+1mABuA
	+svMo+TEzOMIcJy+BNBg8Aj/BQTr7Cnmk32wCV1tvOJOyjdyiRN9sCmG1NNkaA/8fQ+Z0JQalTa
	XdhGXQZJkoD2pQJ6X0wkfV5uwIV6a9KqSube4/8geOnRRPTU1c2CwW5dGfR3Qv1kI4f4krn+SSw
	YBmPgNWFfqefdwUJP76aykR4D2RHUr+iLX/kFSbpnPFA/80UWCVOe6ZDxl+gE3eEzcYgwQbGt7h
	HyuuPs80t6DEX5au73V0DHxv77P3gi/ZIbfXW3jSTfAty3ZQ4wUDUKwUoLGBf4Jjk4WrgC1vc
X-Received: by 2002:a05:6000:2dc7:b0:4a5:bb9f:9c3c with SMTP id ffacd0b85a97d-4abb4c7ac0dmr2588519f8f.53.1795134369416;
        Thu, 19 Nov 2026 16:26:09 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:09 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 17/24] net: dsa: rzn1-a5psw: Add fixed frame length workaround for management port
Date: Fri, 20 Nov 2026 00:25:27 +0000
Message-ID: <20261120002549.1908299-18-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The ETHSW IP used in SoCs such as RZ/T2H and RZ/N2H has a hardware issue
where the internal mgmt_tag_vld signal is asserted as a level instead of
a single-cycle pulse. This causes the frame length counter on the
management (CPU) port to over-increment, so valid frames are falsely
detected as oversized and dropped.

The recommended workaround is to program the maximum frame length
register (FRM_LENGTH) of the management port with a fixed, large value.

Add a management_port_fixed_frame_len member to struct a5psw_of_data to
hold the SoC-specific value. When it is set, program A5PSW_FRM_LENGTH
for the CPU port with this value in a5psw_setup(), and skip updating
FRM_LENGTH for the CPU port in a5psw_port_change_mtu() so that MTU
changes do not override the workaround.

No functional change for existing SoCs, which leave the value unset.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- Marked of_data as const pointer to avoid build warning

v1->v2:
- Added info about the IP issue and the workaround.
- Updated commit message
---
 drivers/net/dsa/rzn1_a5psw.c | 17 ++++++++++++++++-
 drivers/net/dsa/rzn1_a5psw.h |  3 +++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index c59d881ce10f..9475e53752ce 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -211,6 +211,10 @@ static int a5psw_port_enable(struct dsa_switch *ds, int port,
 static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 {
 	struct a5psw *a5psw = ds->priv;
+	const struct a5psw_of_data *of_data = a5psw->of_data;
+
+	if (dsa_is_cpu_port(ds, port) && of_data->management_port_fixed_frame_len)
+		return 0;
 
 	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
 	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
@@ -995,8 +999,19 @@ static int a5psw_setup(struct dsa_switch *ds)
 		if (dsa_port_is_unused(dp))
 			continue;
 
-		/* Enable egress flooding and learning for CPU port */
 		if (dsa_port_is_cpu(dp)) {
+			/*
+			 * Workaround for ETHSW IP issue, mgmt_tag_vld is asserted as a level
+			 * instead of a single-cycle pulse, causing the frame length counter
+			 * to over-increment and trigger false oversize frame drops.
+			 * The recommended workaround is to set the maximum frame
+			 * length on the management port.
+			 */
+			if (a5psw->of_data->management_port_fixed_frame_len)
+				a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port),
+						 a5psw->of_data->management_port_fixed_frame_len);
+
+			/* Enable egress flooding and learning for CPU port */
 			a5psw_flooding_set_resolution(a5psw, port, true);
 			a5psw_port_learning_set(a5psw, port, true);
 		}
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 58690f5f3887..942931cbc402 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -237,12 +237,15 @@ union lk_data {
  * @npcs: Number of PCS connected to the switch
  * @cpu_port: CPU port number
  * @tag_proto: DSA tag protocol used by the switch
+ * @management_port_fixed_frame_len: Fixed frame length for the management
+ *   port to account for the HW issue.
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int npcs;
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
+	unsigned int management_port_fixed_frame_len;
 };
 
 /**
-- 
2.56.1

