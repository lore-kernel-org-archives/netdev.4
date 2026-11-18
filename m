Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.196
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998047;
	b=pPMx68fhXCToABsnibxHL1YTxvEAS8sy2IogWYrfZIVcHdLjojmabtLb8D4BfuPy/rE1
	 amZ+6IOnl4Wciw5fnh6TWAPgR8UX21ugDXy1aPIne/24BqqvxJOHMzcSCe19NQWD9N+TS
	 d5sswlS7Zj6qsI2EiCGP5PnKc3z4FdjXPtwaf/O768UwAT3yHmpUWN9SOaoM6dojZTEgn
	 3HbAvr/JKLMH78Irrl3DlBC0IW1LDZWPaHj5Mpgfa24VUXquLlsd2u6O6GeKfUmljQkHK
	 7fNNGu4nNoAbeOBemkoK4VNV/f48cn3CYRoL7ctSdtth1Uj0KHzQPu0Bw1krW5iMfEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
	b=M5g+d4FupWDVr3mIxPoLp4KmX9DFCj+L5c2AYnMhD87h843fBOWKjIirK15qLNq+o1CL
	 jkmEInYdKmnMz378bDtxXmHePmS5UHebkhYOfj3oioeSvOjPZ82bCFX9BjA0hRnkJGp23
	 66TPgJ0XN3bev9RQxoxL+D9lBoICTcfshY5K8gkGDQ0PzN1g8ktZGbYUiJjo/9LaD5l+y
	 WFk7qIAE348pep6A/tfohhrrZDIGFu0KX9H+2r3WAb7CFp/1+bbPI0oswd7ueWjQjkTfe
	 Td4i00ApDdf9702qmCS2ptD9EnJDPXU1jiF6T3ydl3s9oIKvf3cdlahHYDr9MVK/I+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRuL5z+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.196
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7F5606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F7F5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TRuL5z+J
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-4e4a4d77e5bso1187319b6e.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:34:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998046; cv=none;
        d=google.com; s=arc-20260327;
        b=kbXDs+3wdb048YXNQyzGGLfiI0Zj9pbABxey1gwr33TFnv1Lq4B5CXMj6egAHnjKXF
         paseyAm49l4kWDiUz7HWCqbMM0y9LTuJvP1jehqHVT1bg3kPkgVwdzCgyW6XTu9GYeer
         wcm1zlqGybgiD/jn60x2liKm5rg4K7YycsLv7c1mZoLqiAWDzjnVHsfbCfbsYeS8e8SN
         O6QWXm1A0CBMCMPGG+EHL5i9MyxSUOaVxlyW+xfU5d1cnkiPxOe+6bexK6SuqcwajgbC
         EBVhBMe/5wNGBFg6t7yJm1jz0zzBeaiAxLscDkFP+qhtWJqFnu1IXKTCtkp3pw5B5XcI
         X61Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
        fh=YHzyYXqvc8ZgfM5Mj0NZmwEJIXrf9r+zB3yQr95G2/Y=;
        b=eMHGqaOm9D78pPlqjRRarVq3BXtW86+sc7jMfYrUi7tws8ACdajzIqf7tdEnrF/6ek
         /A7bZvucam8ldW82+ZLGu36OpFYl1bTUWK5E2OJaYAP3mEQeouXkDzoAw2N/lwF+sr7J
         0hhGcxGruGe22jCijwRfvTwgM+7dYdEN3RA5q0fT72avJ7CsVYb9u1EvXIvvIZo/ttLQ
         ICpYd3Ekh5KknoRPuy0YagfPfiwMit90uGDaetSwCyZV7hCnSBENhUZjv+dnTd3+uSQO
         Y1KImPB1IQZPtf+bwFonoCiVx6ZtDdItZmk1iZ+Kyce292n/PA18w/1gICSMPuatKnY6
         iU/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794998046; x=1795602846; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
        b=TRuL5z+JyiXtqMV1bBXCt37cOPJ1DQtkjdUGdRLP2tfjFbadpin1c9cRf1MWTLL4zf
         4FfUuQdTQeFEq7Lxat9eSruKBJWV58r8ql/TshEEDB5fj/yiBrWHe2aMFxoN7QWpwV5/
         r+AT8sDVKt9RhDfJZwBYVQVTHztqY9JEzKVnrmprqph/nLew9ENehPWRiQzKZmx9znRF
         bJhLfJwa7J680QJ6b/aveaLx58Bf00yyQ1H09zPwwVtKtGEvxPyJsCt3PhTHFETB6sbR
         RGb+yjaSkGJJE5bXSmcOytI20kh/BtCtJDsvX/xg2IRtPNFqtCL2ibTXA+MTGbNSewy/
         fUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998046; x=1795602846;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eD7/BYNgXt5h1pVY4hpidQ7Lmdtjmpv7PndDUmck0HY=;
        b=kKpeoeIAaHbAunEUG9p7E018Un6iKpGtQtZMTTX8vn8AeCjzuCJqh6/6mw0boB+eHX
         jvLCNYUN5K1T7WnEt6WBS7ewKIbqVSX7LGy7wmlUSO/vv3aKQcRNTamjx0d77N0FBrVQ
         +sPcbcZlen7EdmLkT4QZulUaO0BBDz0k9WFpFEciUUAvKjnU3/Z5jPDIoxs8bfNJoGi/
         Dkjot5ZxGu28+ZmdqmoAcIFusJJjh2dBT00/syGUAg5HhWRVj5c9Ohwu1UZrmQ1w3kNB
         5BK1es9wAybhsO3BnnAHQSHJqlbLUt3Ics6t9owFpt9Y/e6bJ/TXBHvJd50k87uUsuOC
         Hp7w==
X-Forwarded-Encrypted: i=1; AL+hErFIlyKBpypW9ybTMd++r71WCWu5XTNL1MN/jl+1rdBuAHZQU7aYUy1tOhqIf9yV6+PsWmaUhqE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VG4nUqqRQLYEoli598DVyzTd/EFpyJpr8ZPqWx0ME5Tbsu70A
	zcTDn08+SV6DIYsGPAGA+lEySJ4VU5p9Juy5eeJjfBCiN5oMwy0nayxj5FK/U+MBH0H3SBVTO0p
	LDfixugLGnXvqt0LzkZ1X0RHwHdNi7/w=
X-Gm-Gg: AYBFou2AgNLhlqtc7PftoAOFCkMqZD5dXW8CHvjwVzwBqNxNyNmB12Xh+fz06XPiOx0
	7PMgkIcrvG5/dZm15peqpXev9HUzc1rZB2NcWvanfIChKWdkR+gUe2BceGj64rUXFIdvX70j5tq
	qyoaaj9XR9QBGjnrZurrbEZbK0MtJAV95ggcstkJJuxJ3VU1Ulx2MwMZ4xJEK2J2PR8RheW2UL6
	sG4e2ozA0KlhZi/wxOj+AKPf8RC1mALg+WQiKRr6VanPN2TN8dkbjGCRtawc/G79IpuAhADA4hA
	zuRqFJ1GIrN4u88lGqE6Sx0HFGtNKqYlRv0eQmNi0GdDgWzwpIUENELgErLHJ2T6JABB1Usrn9F
	CUE0LLCPwdy1Vb5pQzELNdL6kWDXx4h4PejoVxg==
X-Received: by 2002:a05:6808:19aa:b0:4f5:1b84:8cd3 with SMTP id
 5614622812f47-575de219591mr3657684b6e.24.1794998045564; Wed, 18 Nov 2026
 02:34:05 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 18 Nov 2026 05:34:05 -0500
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Kimberly Morris <gy770616@gmail.com>
In-Reply-To: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
Date: Wed, 18 Nov 2026 05:34:05 -0500
X-Gm-Features: AclHuK8WIVSjjIrb7TdnAfEEBy1zcw231lawsvJVKduGoPyZtKzF5afdrtfK-Jo
Message-ID: <CAD-64Dfm-2U=1f3b7y3K-B3q_mijQ0xypqUEDt7o+q7Tmxx_hw@mail.gmail.com>
Subject: [PATCH net 1/2] net: phy: restore timestamping state on probe failure
To: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	florian.fainelli@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	richardcochran@gmail.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"

A PHY driver can install a devm-backed mii_timestamper and select it as
the default before its probe sequence has completed. If a later probe
step fails, the driver core releases the driver's devres, but the
phy_device retains both timestamping fields.

If the generic PHY driver later attaches, skb_defer_rx_timestamp() can
dereference the freed mii_timestamper. This also affects non-PTP packets
because the receive path tests hwtstamp_set before classifying the
packet.

Save the incoming mii_ts and default_timestamp state and restore it on
every probe error path. Restoring the previous values also preserves a
timestamper installed externally before the probe.

On an x86_64 KASAN kernel, a KUnit reproducer using a real mii_bus,
phy_device and phy_driver triggered a slab use-after-free after the
failed probe, driver-core devres cleanup and generic-PHY fallback. The
same test passes after this change.

Fixes: 39db6be781cd ("net: phy: broadcom: Add PTP support for some
Broadcom PHYs.")
Cc: stable@vger.kernel.org
Signed-off-by: Kimberly Morris <gy770616@gmail.com>
---
 drivers/net/phy/phy_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b39e945..4017568 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3812,8 +3812,10 @@ EXPORT_SYMBOL_GPL(fwnode_get_phy_node);
 static int phy_probe(struct device *dev)
 {
 	struct phy_device *phydev = to_phy_device(dev);
+	struct mii_timestamper *mii_ts = phydev->mii_ts;
 	struct device_driver *drv = phydev->mdio.dev.driver;
 	struct phy_driver *phydrv = to_phy_driver(drv);
+	bool default_timestamp = phydev->default_timestamp;
 	int err = 0;

 	phydev->drv = phydrv;
@@ -3951,6 +3953,9 @@ static int phy_probe(struct device *dev)
 		phydev->drv->remove(phydev);

 out_reset:
+	phydev->mii_ts = mii_ts;
+	phydev->default_timestamp = default_timestamp;
+
 	/* Re-assert the reset signal on error */
 	phy_device_reset(phydev, 1);

-- 
2.55.0.windows.3




On Wed, 18 Nov 2026 05:33:45 -0500, Kimberly Morris <gy770616@gmail.com> wrote:
> Hello,
>
> Following Greg's request for an applyable patch, this series addresses the
> automatic PHY probe-failure lifetime path from the earlier report. It does
> not rely on the root-only sysfs driver-unbind trigger.
>
> A PHY driver can publish a devres-backed mii_timestamper before its probe
> has completed. If a later probe step fails, driver-core cleanup frees the
> owner while the phy_device can retain the published timestamping state. A
> later generic-PHY fallback can then reach the freed object from
> skb_defer_rx_timestamp(). Broadcom BCM54210E/BCM54213PE also leaves a
> registered PHC backed by the same freed storage.
>
> Patch 1 restores the timestamping state that existed before phy_probe().
> Patch 2 adds the missing managed Broadcom PHC and timestamper cleanup.
>
> I reproduced the first issue on an x86_64 KASAN kernel with a KUnit test
> that registers a real mii_bus, phy_device and phy_driver, follows the real
> failed-probe and devres cleanup paths, attaches the generic PHY driver, and
> passes a non-PTP skb to skb_defer_rx_timestamp(). Before the fix KASAN
> reported a slab use-after-free; after the fix the test passed without a
> KASAN report.
>
> Tested on:
>
>   - upstream master 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
>   - net/main 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
>
> The submitted series is generated against current upstream master
> 63fdb511c27afcebce797e3db580b3534ddfa639. I have not tested it on physical
> BCM54213PE hardware, and I am not claiming an attacker-controlled probe
> failure, privilege escalation, or code execution.
>
> Please let me know if the rollback belongs in individual PHY drivers rather
> than phylib core.
>
> Thank you.
>
> Kimberly Morris (2):
>   net: phy: restore timestamping state on probe failure
>   net: phy: broadcom: release PTP clock with PHY devres
>
>  drivers/net/phy/bcm-phy-ptp.c | 19 +++++++++++++++++++
>  drivers/net/phy/phy_device.c  |  5 +++++
>  2 files changed, 24 insertions(+)
