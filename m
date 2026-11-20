Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146430;
	b=gkeYtjTSybotH6FytSZ0sN8514rIaUsEjWMeRxjXBCUwjFNzUhX4u9oFY6CCEjHxuzcW
	 DWNnUobZyx7y11PACJ21PM5WDSPOCsWUu+q7FfC6AfzS8ZyDa/xVrqcA/6bJZQqTqqC7C
	 HFS3ZaYKhoXg20dzE2ET0yWdo8dR/KrYBmrI4VxfBA1ODEY4Tl844D+rilT44Vr4029+x
	 Al8lVyFg9YwlSDOoxtMAXj5sxfHkku9S+pX3LK0H5D5dtsVFlW3rzPUjAEK5tyc0TKMbH
	 lJ6h/1zhA7WRzEZ8zCPy0xrhT17HSfMtVqFsIiJViXPGufu9lE0QcpHuluZI9KbUMzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
	b=atSgXLJjR5qNDkTJTQbnBvpNsI+StSMxADe61mNOx7FGSGpVmqpT+AaiVw8+U+xq/4Hv
	 9rWYX2L+E8FQfaxuFEHitlndZvha9kpLCGyhJ2IrVZV7aspwufQ3CtMDqdIxfWJoXQ+PH
	 wauG7CZm+2PY42Z7/mZ30aVsqVOdVuezKaA3rayeObyYllvVUBon0WIndf/BVxiAAuYgR
	 02UPt+3gb6u7GK9oQ2p2bUOiHMlwf6lNvyAHOTTKVlCMfqviTitire3r9Qle52niMQGH3
	 gf8BO/9al66r5PI4UQXFx9g6gnT10zU5Jpkk6KvG4Fmkw6+XKb4nD7ZmyFdeTMHY2vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lLf2kzT2;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B294606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B294606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=lLf2kzT2
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so248013a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 19:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146429; x=1795751229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=lLf2kzT2lePKBgkST06X1Iaazif3jW3bNdINE/GdFmoM7vT4txZnJ/K0nhovB8+qzA
         qY2ctuJV+UBu2rqvJLbcAAzW/ut3NeWAmB/kzZzVG7YKgSMQYjPL0q5VRsFKH0Qv99hm
         7W3W5YFugak2zgu93DWFW59YjP7Zt9CkuzRQCLTJBSw8CViQfYETL5O6Ul18Qyf30cUG
         0b4dqlok1MwTlg2acNO0WZkH6a9lK3tkjlRpqfvmTed29LJjf0M47cJERx1vL11/8MEN
         hXuD8PLAiGcBZXbWTOFentBJsiLZRB946I5nigldU236zvOuQZjh9sboJJuJDqGhgD0s
         yhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146429; x=1795751229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=SPS7InokAXtyKKi4uqUOpKxrBqx6kiPegHPb2VaibsDOxfNF75kC5FKc4hQ5aHkLZ8
         y/NqdfpQe8cbV/7Fk+Kgh96LtWzvMqyqIB+pcU5kzIZlCFde+gKOmZ4Z3DFVayu0Nwks
         KoZDkHhJnlyyxIs3V3/TaDl6VoMZ0RXuUDiUKSNBWfocQ1lsM+FHqINTTV1EeIZDaPhe
         cfCT6dqKLE2LaBIHfx3OOrk4vCeQbAteuIuXMsJCrQa1W8E2Zio32QYhBKBHOm5Cr/LS
         gYbQqmuRycqZQzAgWsw59QoSKnAFjNKlnjCT5Cr3nQiONqc9Wn4pJozR3inNlOCVwrGp
         xOQQ==
X-Forwarded-Encrypted: i=1; AL+hErEc8fyZ5EiLxR27o0S6pknnatW18pU8cMnUoIJNMdtEDE0daMwzGRvM5yq6DtBtp6FvOF7x6ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rDAuyZftNWRGUP5SOulLlcMMluLjRiHjpzzjBkrX4muysEli3
	Fz6PHi7eKzKG2Oyeg3XgdhxJ7370BaSE6u+Pt0aHbAHzGd3/eFIuFTKVUBcUWCZhhA==
X-Gm-Gg: AZFdTZf1W62ZgeCy/klAxsOvh2ruGpJ7ifp39oeJvyp1VqVMLIAU4Zw/OXt8JS/3wYv
	JGqZSKJxwEIkDHCDgfxlzMxukoQTFOtN1p5Z/lFFlNdD/Y6CUYlROmITKi+2kkd8SarPQTVSAeA
	C6ib2c9v7KfbRME+aB1GAfBLhfFnY7qcOeuoynqeZ7WTjQgBkiVOotKkrbkVUqkMGvbS0hLMjfj
	dEUUn4fpllTMn9zRX9XUvgTMNDiH6PqTvYFa8fGZSpAlfpZEfo8Rn3hVTL6f2Zn01+INRAhAhOP
	v7cTYrxE+vhywf71bmtEoFCxsjWwzItFIxOpu0r0AdLd0OlpsLz5oBOfLBzZUIXJdDPBMp1sk2M
	xmT2JsHsDADdDbkBrclaEdu128s/l26qYx6kzbAbqR/jBbmbo8+oIuNnmkFS453aurQqafkpQS7
	GZlsf69cVnumGtv5itJVZUq+Rp3oRl3zbJP4srx/xxGIzblDjRlCEEYl6B1rqfi7FfwrwsidtJ4
	f7ja54nZpD2nF6RBh67KJH9nO7s73JbdQnNQoWaGRT/H/a7F6WQ3ifARf6jcKnjK+DKkKJTZgMi
	H2loMc2t7CvfFETDThu7dcsY6mE5hRmnjcfyb+7ebkZBjgqKC/FjoH5Y5fmqGkGsIld9mSx7y//
	At1gp+OITYzqQkBv+8g==
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr1285768a91.13.1795146429308;
        Thu, 19 Nov 2026 19:47:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 0/2] net: ethernet: ti: am65-cpts: add PTP_SYS_OFFSET_PRECISE support
Date: Fri, 20 Nov 2026 10:46:59 +0700
Message-ID: <cover.1795143925.git.jjc@jclark.com>
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

This series adds PTP_SYS_OFFSET_PRECISE to the CPTS driver for TI K3
SoCs. This brings a similar hardware-supported level of precision to the
transfer of time from the PHC to the system clock as already exists for
the transfer of time into the PHC, whether over the network using
hardware timestamping of packets, or from a GNSS receiver using hardware
timestamping of its PPS signal.

The system counter of these SoCs, the Global Timebase Counter (GTC), can
export one of its bits on a push event output. The Time Sync Router can
route that output to a CPTS hardware timestamp input. The CPTS then
timestamps edges that fall at known counter values, so each timestamp
gives an exact pair of PHC time and system counter value. This is
similar to the PCIe PTM integration on these SoCs, where a selected bit
of the PTM timer drives a push input of the PCIe CPTS.

v2 drops patch 1 of v1, since it has been applied to the mfd tree [2];
it added a syscon compatible for the GTC register frame that selects the
bit. In v2, patch 1 adds a ti,gtc-push property to the CPTS binding,
which names that syscon and the CPTS input; patch 2 implements
getcrosststamp.

The series does not set up the Time Sync Router. Mainline has no binding
for it on the J722S, so for now a board overlay sets the route, as it
does for ti,pps. With Rahul Sharma's proposed binding for the router
[1], the CPTS node could select the route itself. ti,gtc-push would stay
the same.

Tested on a BeagleY-AI (AM67A / J722S), a BeagleBone AI-64 (TDA4VM /
J721E) and a BeaglePlay (AM625).

With this series, phc2sys steering the system clock from a free-running
PHC sees an offset that never varies by more than 1ns, whether idle or
under memory load. Since the PHC and the system counter run from the
same oscillator, this is the noise of PTP_SYS_OFFSET_PRECISE itself.
Without this series, phc2sys falls back to PTP_SYS_OFFSET_EXTENDED and
the offset has a standard deviation of 2.5 to 10ns when idle and 22 to
31ns under load, with excursions of up to 200ns.

When the PHC is disciplined (by ptp4l or ts2phc, to within 4 to 7ns rms
of its reference), the offset seen by phc2sys with this series has a
standard deviation of 2 to 5ns, whether idle or under memory load.
Without this series, it has a standard deviation of 5 to 12ns when idle
and 22 to 29ns under load, again with excursions of up to 200ns.

PTP_SYS_OFFSET_PRECISE has a fixed bias, the capture delay of the push
event through the Time Sync Router and the CPTS input (about 11ns, plus
an undocumented delay in the GTC), which did not measurably change under
any load or CPU clock. This series does not correct for this bias. The
driver similarly does not correct for timestamping delay on extts
inputs, nor for ingress/egress latency in hardware timestamping of
packets. It turns out that the bias in PTP_SYS_OFFSET_PRECISE and the
delay in extts timestamping largely cancel each other out. The offset of
PTP_SYS_OFFSET_EXTENDED relative to PTP_SYS_OFFSET_PRECISE is about
-50ns when idle, and moves by up to 40ns with memory load and by up to
60ns with CPU clock frequency.

The implementation was also stress tested by using ntpperf to load the
CPTS (-D 0 -M at 15,000/s and -N 0 at 5,000/s). No errors or wrong pairs
were seen.

To try it on a BeagleY-AI, apply this overlay:

	// SPDX-License-Identifier: GPL-2.0-only OR MIT
	/dts-v1/;
	/plugin/;

	&{/} {
		#address-cells = <2>;
		#size-cells = <2>;

		wkup_gtc: syscon@a80000 {
			compatible = "ti,am654-gtc", "syscon";
			reg = <0x0 0xa80000 0x0 0x400>;
		};
	};

	&cbass_main {
		#address-cells = <2>;
		#size-cells = <2>;

		timesync_router: pinctrl@a40000 {
			compatible = "pinctrl-single";
			reg = <0x0 0xa40000 0x0 0x400>;
			#pinctrl-cells = <1>;
			pinctrl-single,register-width = <32>;
			pinctrl-single,function-mask = <0x000107ff>;
			pinctrl-names = "default";
			pinctrl-0 = <&gtc_push_route>;

			gtc_push_route: gtc-push-route {
				/* input 11 (GTC push event) -> output 14 (CPTS HW5_TS_PUSH) */
				pinctrl-single,pins = <0x3c 0x1000b>;
			};
		};
	};

	&{/bus@f0000/ethernet@8000000/cpts@3d000} {
		ti,gtc-push = <&wkup_gtc 4>;
	};

I used an LLM coding assistant to help prepare this series.

Changes in v2:
- Rebased on net-next
- Dropped the syscon compatible patch, applied to mfd by Lee Jones
- Made a failed ti,gtc-push lookup a warning; the probe continues
  without PTP_SYS_OFFSET_PRECISE (Rob Herring)
- Three smaller fixes to the driver, listed in patch 2
- Link to v1: https://lore.kernel.org/all/cover.1794284248.git.jjc@jclark.com/

[1] https://lore.kernel.org/all/20260828100615.1700223-1-r-sharma3@ti.com/
[2] https://lore.kernel.org/all/179511436097.97786.7515300839199702588.b4-ty@b4/

James Clark (2):
  dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
  net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE

 .../bindings/net/ti,k3-am654-cpts.yaml        |  17 +
 drivers/net/ethernet/ti/am65-cpts.c           | 313 ++++++++++++++++++
 2 files changed, 330 insertions(+)


base-commit: 5b87a11b1547c39da01718044b9f99fd85948b9c
-- 
2.56.0

