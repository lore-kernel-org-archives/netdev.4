Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125654;
	b=kORq9wlYS66BXGVqhl4IewpLie4ufXAwkq0qhM2k1/2dKraAqK45QDbb7KvXNFdh53Q/
	 Os8B9wIO6U+/xEkYsOW+NXzNVMXyn94QjtSXwRLZk4bOlTUXbHj7r/M4rbbyXjrxq/8Xi
	 pwncdW4LT2l0Cs6O92WC0aDdp3SRF7eVDaH+kBCzJZ28TYl18+5MPsLrwTl1wcI4gwFP8
	 9cQDNwjDFNg6sZWUbMlH3knbTwjWqFGJbhAitK5HFIy6qqcWTbhYtRFFuHZxIQPJfdS73
	 0exBglKEcqgMQ4WfC4DlJQ26wLVBiTeFQCcz7NM0E0oMJG1PiStBFIjftHhc4MeWiww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125654;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=pNDZPWuH8qOQiOPgJL0XMP3VcOWD8H9Wvc5UTD4Lyo7NSiDafkFCyAC4ZXf/bVuaInwT
	 ffvesxp3QBVkknf1K/5BcRX3sfun3vGydRV+eW4UM3Q7Hj8r9aT37TrbK4Wtu1BaxGcGo
	 bUW2/xPGG0++5FTXdCUJF4naiupFacuQSrDDVLaIMb+E6blVmFuCSnOnQkJPgbYFUGt6V
	 dAGqbeJCHac3appn3OSUgzI9v9KMHESPsb5eI1CMjFVC62H9SVgq5FzxLe9uHTbeJDqs7
	 80h8bIulapfFQsXZLPbKedMDrKU+0db3ghvxlxPbN75PyMG2sH/imHJSKEWiWo1u4yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="V/KS+MU8";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EuYBfGL1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7E3606A339
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C7E3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V/KS+MU8;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EuYBfGL1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795125652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=V/KS+MU8saQytHXySi9g0nTfaTi9OkDjJ7NqOyJgo7ifPTV5WRXBzM32gGTVFfxui26odd
	A3paesVCVgmFE2AE5XO4PoQrou4GKESl0SHbjgxxy/SpYXcNSGJ6PsNyAv2vIArsP0g/ac
	ep7OCy+ijRIwIoV2dusSU0k+mIr0hdY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-Gmia9pRiOTK77MU6BWEG9A-1; Thu, 19 Nov 2026 22:00:47 +0000
X-MC-Unique: Gmia9pRiOTK77MU6BWEG9A-1
X-Mimecast-MFC-AGG-ID: Gmia9pRiOTK77MU6BWEG9A_1795125646
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6ceb2d54so44365e9.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 14:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795125646; x=1795730446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
        b=EuYBfGL1HxZzM/28OS0t2p+j2Ti2Z2PQAx4vTNJZD/B1crrT5Ec8OFjcSj4LxlLsPS
         1ZW3VApZtlVtvErf+W6mE0PamRnsxB8RwnYso0TS4+FlOvq/pphhBEEru+KCaZn68bQJ
         WPurgqGKPXFtbCuKP5iZwPqITh9rQn0rJXFkMToc0qoqeBpWlTG4beQEukgEGdCP1dZ4
         7W4nZZN/8Mi3Mv5HEBa/tP8xGMsDuHtE3BuO9kn5ExtiIzFrVOwroJLS8rVIWL/dyKXM
         eE11g8vH7l05sdNloQXaFH7ti2M87mPLkY70xzhbFFoVK6rblv8bPI06Fzr7L6WCKhXl
         uGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125646; x=1795730446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
        b=Z5gLd3IIRGLkFTvvJc88jMNdxAy6GkhUmknqf1G1zICzmMZNgcCg9KNsQfxAsbJHwr
         t6f+bb4DS5N9FHtMaPLqI8Y/39HxMIMIG4Wp6FuInL2o5wj7OAGPGnblE0gHER+HwsCj
         kNQAWWADSDkHqmQ3FZvbiTZ8z2O5Fg9l59GbDKewq21W0+gcr7WgDgMH38Eb/zf/prgP
         bNoqIMsmi9aeIB6oO8dq+wumRFzJvKeKXNvDsTB72+GNzaztU4cDA1bNfWsbcA3khlDp
         +8z5f/uJco3OPIu5SOSlSFUJeV7a0YuiBBY+0tBjXe46loSrS8W4stMBTUTcnZUCMdd/
         28QA==
X-Gm-Message-State: APuU4Z+HZUjygdoM0DuHkCiV9FVvSVT+nTBfaU7airA4A6jdlEqf/bAo
	NxPWJ3TBrpkS3ZMURYhV1jpM/nF0rYiquX9TQctKAl5BdS6sdo8+/scUSIaCCl377o7SbuOmNG9
	kPwULUmW3WZF52WnPRBGFbZAbUBW00haMufLd/UBuayLG3i3kM+bNoHXnuXeXWImPEHREQ21GID
	Xsjp7hpBCx5XZUEsiWrCdsm/Id2ZQOU7FU0TLsOkYmDDW4
X-Gm-Gg: AYBFou38MNsffia2n02vnjs98Ohdwov1rOX91H51uVbFYzymssgtNSCBA1sgjp9ua7V
	oXvBq4CJC/0PJ+0XM6k5IXEv7Dj05Ja/1j8e5Y1Isa/cW3ZpnqH7qhoIVrWNubA9UDtlH9jeaqr
	JNjIH/SLUSKBmZjmQLp3oe8IqnqIZM1JJ60RYn3cIGOqLgnzoDyUuZC9o5q3MmMfYtsm6o2E5Fv
	yD7jJOYi+RZTMG2FwU262KJuyZhM66NBXVj2c5mLXWJAv8Y7rEWmllFd/A1qd0fDIoH5YpysGca
	G0XATL02zAIGFPgFD1bDHccYzG33akvhFZ6OI9FxUMSxmb+7LvXarhvJVPe+x343jFmdq6+lrFB
	8zlCjlz9EmG4XzWcpYNu2oldg7k3v2c/VV2dP1HMGy5YUX/NxE3piTrXtkRDpP+nLudNV0pNC4n
	IGy97kaxRyDo+EIQ==
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15282245e9.1.1795125646380;
        Thu, 19 Nov 2026 14:00:46 -0800 (PST)
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15281675e9.1.1795125645874;
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm1963679f8f.8.2026.11.19.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
To: netdev@vger.kernel.org
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v4 0/6] net: enetc: S32N79 pseudo-MAC (PPM) networking support
Date: Thu, 19 Nov 2026 23:00:34 +0100
Message-ID: <20261119220034.1658710-1-eballetb@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
References: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
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

On Fri, Nov 13, 2026 at 05:02:31PM +0200, Claudiu Manoil wrote:
> This series adds networking support for the ENETCv4.4 pseudo-MAC (PPM)
> ports found on the NXP S32N79 SoC. On S32N79, the ENETCv4 ports are
> not wired to any external PHY/MII; instead they are internal "pseudo-MAC"
> links into the on-chip NETC switch. These links are proprietary, expose
> no standard IEEE interface, and run at a speed fixed at boot time by the
> Port PCR[PSPEED] register.
> 
> A key use case is a port that has no "ethernet" DT node at all: NETC is
> reached over PCI from a host that probes the ENETC, while the internal
> NETC switch it connects to is not owned by Linux. Such a port must have
> its fixed link synthesized at probe time.
> 
> The driver synthesizes the fixed link directly in C using an of_changeset:
> of_changeset_create_node() adds a "fixed-link" subnode onto the PCI
> function's dynamic OF node (CONFIG_PCI_DYNAMIC_OF_NODES), with the "speed"
> property read from PCR[PSPEED] at probe time and "full-duplex" set.
> phylink then picks up the fixed-link node through dev_fwnode().
> 
> The series touches three subsystems:
>   - net/enetc:  pseudo-MAC fixed-link support, probing of 4.4 devices
>                 and a fix for more than 6 ring interrupt vectors
>   - arm64 dts:  NETC IEP18 ECAM node on S32N79 and its RDB board enable
>   - PCI:        a quirk creating the OF node for the ENETC PMAC functions
> 
> Because this is primarily a networking feature and the pieces are
> interdependent at runtime, it would be most convenient to merge the
> whole series through the netdev tree.
> 
> Patch 1 has a runtime (not Kconfig) dependency on
> CONFIG_PCI_DYNAMIC_OF_NODES; absent that, the pseudo-MAC probe path
> fails gracefully with -ENODEV.
> 

Hi Claudiu,

I tested this series on the S32N79-RDB board running latest mainline kernel
and applied your v4 pseudo-MAC/PPM patches on top.

I used, though, the MRU MSI controller for NETC IEP18 overriding
the upstream msi-map property with msi-parent pointing to
the NXP MRU MSI controller (this driver is not upstream yet but I ported it).

With that configuration the ENETC PF probes successfully and networking is
functional on the board. So,

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

[1] device-tree diff

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 897ba24ac03a..a8a3602505e2 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -70,5 +70,37 @@ &usdhc0 {
 };
 
 &netc_iep18 {
+       /delete-property/ msi-map;
+       msi-parent = <&mru_msi_controller>;
        status = "okay";
 };
+
+/ {
+       aps-bus {
+               compatible = "simple-bus";
+               ranges = <0x40a00000 0x0 0x40a00000 0x2000000>;
+               #address-cells = <1>;
+               #size-cells = <1>;
+
+               mru_msi_controller: msi-controller {
+                       compatible = "nxp,s32n79-mru-msi";
+                       msi-controller;
+                       reg = <0x40a40000 0x40000>,
+                             <0x40a80000 0x40000>,
+                             <0x40ac0000 0x40000>,
+                             <0x40b00000 0x40000>,
+                             <0x41a40000 0x40000>,
+                             <0x41a80000 0x40000>,
+                             <0x41ac0000 0x40000>,
+                             <0x41b00000 0x40000>;
+                       interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+               };
+       };
+};

