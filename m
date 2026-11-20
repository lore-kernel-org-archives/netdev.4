Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795154588;
	b=xLffhpDK3xcTBtZr509foah3X/CRauN/pLRwpLxV71zIc1BGB1Rn8cn92nLKiIdi7dGI
	 AvQHKKSD8EygIHqSGJV3dGcMZLxfpktS27ntKWBd8mRwtTPO+2qLb44Cs3tOkcQwZaAml
	 TxLvaEfPtBMg+gwheSjGtIIejWyqQ6pKTxz/W52m0TBFuQ1lFMcLuHWa3rRH6GkGF7ym+
	 FEFuMKP90Qm0otU/jUZOGJ6QGQUadkNKbdRjp81LWDILy/dJFkfdxIXV9onkYhC2uPZue
	 VpNq+bJAYtSkYjmvuN5z33ze0Mdb7sqqVFbv/6IY/htqK7EGJutjKxfDLnEZtpRbYXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795154588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=dHo1uLaePnq0/jqGRRY6HsTYF/uviwK8u7AVps7GapM=;
	b=YiyEL/u6iMUQmMe7tV14ugHGsyelWT6IOqiRfb2i1m1vjI6WnAd3SFFnrhx9a02CYx9p
	 uZuMauBozLm7nxMz+YXZcBFCOAj70bpEoog5XQkz4rzZgeJrY5v+7I2DiSbW9BPsPtTjX
	 qORC7E7EooAYeXr7MduajEJxKow3opLL/B10CRLZBElzLN1gpYmm/Isi6TaRKZxvCS4YH
	 SENOREFm3ycQZ5wvdsV6bMzJkVIjnpwDHaYvFXhqfHMtbF6/UcJ1EE4gAi1HVpE4euzYL
	 abkSLACxFnWjQ0nSvH31WrJDbeVj4MqEC0HmuGIu9g0Np50DfXvsag8bgl+3kPONbsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrPPncty;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E13606A529
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E13606A529
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OrPPncty
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-860f8b7b943so225399a34.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795154585; x=1795759385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dHo1uLaePnq0/jqGRRY6HsTYF/uviwK8u7AVps7GapM=;
        b=OrPPnctygCKm1/pZi98/dBkUFXfXasfPg3I6gHdkgrd8JBs35P9/Ih2tj3owOSDWlE
         nmo+dCQAmAYTGX6MyD+VfOdVUGoYH6bPh/rrkSbtQ0fWJhMsnIbVR4i+JpVmfKCtuoxO
         1bFupSDpPYVDzkBfcj8tndWPFc3N9xu7ytTSPGM9dv3ESCjD0u5dL8vpkNNtW3fejACY
         RG98k7pAPBOQzJ2lnI/c9o2XB0eqCX2/AS4OMiKDW8PgkrDilsTo1XbGwIUsa5VES9xH
         7i3Y2lYE/TNI8zoA8VxjhFK9pt7FNq5JgHiL52LG5OLwGSknzUCCT4XO7fHKGWkEZZpZ
         fr/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795154585; x=1795759385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dHo1uLaePnq0/jqGRRY6HsTYF/uviwK8u7AVps7GapM=;
        b=RuPKJwAVrShIgOw2KkOvG//SLzmH5ge6SUUtixItxuC1rQm2Wn/slewfq24uFkTqE3
         KvIO8OSCldpc2m/1VXuCNvIkxZmYzOqA4rBw2uzGJPkxedpahZaR3wHcetc6bJOrNBF6
         hZ+eHPYnfUT+Bcdd6hvyObsQqvvdtO89/YcFyF46iqFuN8TvfoAeVjYExs/0DnwUFNEV
         HCOXdLP7x4VgHyPtFJEFeRngbtC+H1f+6AGftZ+6xSF2XIFO/6DF6fAryiorGrzK5tVk
         V6UYHEGrpmFAqk86SBhl4s8jKWASn/B7qNJXp2gV4N6lDRb4Mjt3dJrw9uxt/yEhUHwA
         6Ttw==
X-Gm-Message-State: APuU4Z/bGfBRZ6lWssG4WwWIq9hgtD+ALnEaNIdj45/TyEPZa4GzGsgi
	xSecauqKg4Ln/2lddcmiTS+3u3Av8M8DqWcLpH0Ce9Ief6w9kBXzsAJ2
X-Gm-Gg: AYBFou07QuR4xEYDrILT/r4rzf6e78pGqS2FDC5R75phtIgNubXYCcMNcK1C0cx+r78
	gqaJNvjxWsh/1cBFCOwBRbV3SqOTW99ehBwcVlhQGsmzwq60qOmOutw7wy3o0eqUe8dyV9YPSpA
	actC1pPWKALN68MYZg4CFzlJ2otAVO272oTS7FnKwAEIOmKZAdq1j8o7qXRawnfcySInZKYwnzW
	88ppaRGLNGtlOi8RKvdAV1vmDu9yi8T1RckF7BTp6SIyOb3vbdaTXIWTfcjZdnlqbzFzDMm4TBY
	lMgIF/wfMd+izl21qJFVFpg6rv+QrxmVQ+2Gn7uMkMolSgNnVgP+wUDexq8X2GwaQgAiGDgKWUS
	fDpMIq9Tkofzu/Okbf1bsqa/bebjyZrNoTUmC/kAyX4JpZaVa13B0i5NBbpRQxrhsa9/wGNbqPP
	d8i7wF4hrCrQbxMcjFkSZq1k4OnqkUOQpY1QWCr+6qG1YvT1RPdFVhYQjrNAuy6IQF3tmswmwf1
	drv0N+bMKMunww3eXyV/C3wxmwDRQMJFMDYNC5+37FnLtIVu3OkE5x3OMy6apvo3F01W3+xoVX9
	YDC2pxbshgnu/AaAt07AdnMvVFZ8fsnBtkeiXI/REA3xNs392BhbN1pTPmgKdMfb8fgS+A==
X-Received: by 2002:a05:6820:c5d2:10b0:71a:fbb7:da20 with SMTP id 006d021491bc7-71b3957d3f7mr1406475eaf.58.1795154585012;
        Thu, 19 Nov 2026 22:03:05 -0800 (PST)
Received: from localhost.localdomain ([14.116.239.39])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm1416149eaf.7.2026.11.19.22.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:03:03 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Yun Zhou <yun.zhou@windriver.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Xuanqiang Luo <luoxuanqiang@kylinos.cn>,
	Ilya Maximets <i.maximets@ovn.org>,
	Frode Nordahl <fnordahl@ubuntu.com>
Cc: netdev@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH net] ip_gre: fix stale header length after erspan version change
Date: Fri, 20 Nov 2026 14:02:54 +0800
Message-ID: <20261120060254.3766851-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
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

erspan_changelink() can switch an existing tunnel between erspan
versions, but the GRE header length is only computed once in
erspan_tunnel_init(). After downgrading a tunnel from version 1 or 2
to version 0, tun_hlen stays 8 while the version 0 transmit path
clears the SEQ and KEY flags, so gre_build_header() writes only the
4-byte base header. The upper 4 bytes of the pushed header are
uninitialized skb headroom and are sent to the tunnel peer with every
packet. Switching in the other direction grows the ERSPAN header
without growing needed_headroom.

Recompute the header lengths in erspan_changelink() when the erspan
version attribute is present, mirroring what the IPv6 side does in
ip6erspan_tnl_change(), and propagate the delta to needed_headroom
and the MTU.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: f989d546a2d5 ("erspan: Add type I version 0 support.")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 net/ipv4/ip_gre.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 5485586fa0e6..8acaefca64da 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -1351,7 +1351,7 @@ static const struct net_device_ops gre_tap_netdev_ops = {
 	.ndo_fill_metadata_dst	= gre_fill_metadata_dst,
 };
 
-static int erspan_tunnel_init(struct net_device *dev)
+static void erspan_calc_hlen(struct net_device *dev)
 {
 	struct ip_tunnel *tunnel = netdev_priv(dev);
 
@@ -1360,9 +1360,16 @@ static int erspan_tunnel_init(struct net_device *dev)
 	else
 		tunnel->tun_hlen = 8; /* 8-byte GRE hdr. */
 
-	tunnel->parms.iph.protocol = IPPROTO_GRE;
 	tunnel->hlen = tunnel->tun_hlen + tunnel->encap_hlen +
 		       erspan_hdr_len(tunnel->erspan_ver);
+}
+
+static int erspan_tunnel_init(struct net_device *dev)
+{
+	struct ip_tunnel *tunnel = netdev_priv(dev);
+
+	erspan_calc_hlen(dev);
+	tunnel->parms.iph.protocol = IPPROTO_GRE;
 
 	dev->features		|= GRE_FEATURES;
 	dev->hw_features	|= GRE_FEATURES;
@@ -1524,6 +1531,19 @@ static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
 	ip_tunnel_flags_copy(t->parms.i_flags, p.i_flags);
 	ip_tunnel_flags_copy(t->parms.o_flags, p.o_flags);
 
+	if (data && data[IFLA_GRE_ERSPAN_VER]) {
+		int len = t->hlen;
+
+		erspan_calc_hlen(dev);
+		len = t->hlen - len;
+		if (len) {
+			dev->needed_headroom += len;
+			if (!tb[IFLA_MTU])
+				WRITE_ONCE(dev->mtu, max_t(int, dev->mtu - len,
+							   68));
+		}
+	}
+
 	return 0;
 }
 
-- 
2.43.7

