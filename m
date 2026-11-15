Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771339;
	b=R30QGi2O9UVui9Ifzjsc9mOA763EOtCnw+2qD5ghDtIIV8ELKqhvkTOL/fdIfeG5R1hE
	 JOkibgv8JBP8KXLrcBQ4WEx5m52RUj/MygYYVVMWC/Xg/m/r4LK7nJtvVOAUoRspz7Z+y
	 WcD4GB+XIRv4x/+AQX7q3jUA7mfjiIlN04TmoMH8s8U7OlnL5GsN2pMQBcNUDArP2ASp9
	 LUnr38kFUI4kIInI3Py4h/zLrjZlaOSZ7q22RkuC5YTdIEL4PBlwCA3On4kTcCauIkKhQ
	 2RxprK7OMFrVGSogjzs3Jh8dE+pSHFiumu6khEF9mcxIUg7s3TogRvrk6ahAyOwtrpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Q+RkJ8dbLq2dXw8z3vZfj7Fvc0FFnDlwRUu3YwZ5OCw=;
	b=nVuroPq8oQxxtxHVOPPg0uV5NRFRSdws/bgHN28RYZETQ1vteZFn2nyoV59YLhb5VoMM
	 taRuVK70STDbN+9n4cc+5PlrSEZtrz1VqmLVty/mlTm6SviV6YOvvfn4x++UuS+ERE9Fo
	 dt++PNbLVpNZZLSAPD+fbmmx9lLNvflxirDWmxS48hz55fLfwm2gBFWJI95ozBvO8w/82
	 JuzemTgHo+dCbJGIMJgcOS6cdGygmcDRh/mY6bCiwC0PRU42aG8yw1YnTjVr90l1SnPa8
	 DhVypssT/IEuIdPgFUU39UUbGVmmeP7HQAO/ykmB6Ljh0oKRmO4VkTwvhxE5tkDXPuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NcurtOBX;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869CA606A88A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 869CA606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=NcurtOBX
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d30639709so398955566b.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771335; x=1795376135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+RkJ8dbLq2dXw8z3vZfj7Fvc0FFnDlwRUu3YwZ5OCw=;
        b=NcurtOBXdvjkgdGWXyF+08ppm8Qh0ji1b0IHXl7heKBKk42dlpytkfIlFJiWYj0OMq
         QHktELH/bjYGTL/seO4vNrakDzhWg/M9DL+eXFPIoBwE8VTp0eX78vY8ZHX2jGhAhFcV
         rT/UasnMU+eJL/z88AIIT+u351guTcDKW6iYUKCQygECEQBJ2UeX1rqM4a2l46ynDLlb
         Muupct4LPxfiMqHiMHIymYxDYJ7cVsV2F97hQh8fCE+KmLILoniBmA9WiIalZApDP1cY
         IcON9rXvk/2LnS52t7wgGlFqKRJ0xHG1t7dwJXlhU5b1/3kTsVNrNObwdyQTqCiDgaAe
         /dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771335; x=1795376135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+RkJ8dbLq2dXw8z3vZfj7Fvc0FFnDlwRUu3YwZ5OCw=;
        b=BUcsVDst76qR1FYOyFGOP8KY1+ctwNHyXjx+j7FRjRCmE4KfKJnLh8qCqrD5U+2qtg
         WyIaou6j3J91XfswlzlRGrTiG8kIK7VLrmILUAaWPsVkNN2wPn/UFG7Wvx5VcHCPZH2S
         x0s8wk8Yl/35pWWiQ91GPti9qIgN4R6j/39SpwHgAohkDDvaY8Kf/aHxb2uyOJOVAnxM
         /ieq3r6JckLcCXMPoULHG+DwE2rsS2ZobrMQF2Q7nZ6nKjR+dLxT1guHQteA+J6t/NQ+
         ze+PBcuZcDTCgfXt5roa56AuR3dIM8ywqpo/InMWfKozv6GEV6V04Q9U4nvxU/USEcPC
         W8UQ==
X-Gm-Message-State: APuU4Z9JyZoRkWOe/ZyjG2G1PYHYuJPW6Cxf3TX2AYqYQUrtfIUq6ZJi
	Z02oXrdsgPeTAD0kVTz6anpFKcIExmnKtn/WIdMGnwOwY1devhCyANAxub/dunc3Ch5zR19Yfl+
	VSzI7eqY=
X-Gm-Gg: AYBFou1/XfShH2XSMScjRrKgL2G+c5I4dYD0qSE+JwlNKh3lxZMs2QFGI5/X257sYt9
	EA8FHiPMmi1B3BakktlCBVwfy9tTviWpX9Xv44NGZASeMJYVObzS2ITIT3o8RQgP1ldJmsBVCp9
	0K0JegVCI9A0gofQtyPF9oZnGfJlG9DRQxequ9QzxPRyJL+5EUx/tpMg5gaK8hZcqvf6IoBIuV3
	q88gipnkh7M61F1BjXlr/yqXx1ExSsNiUYdh7hWMyX0ZbXMvLHZ4ognwZEjYBPqQ8J93F/8Ibnk
	LCRHzXYwcXgddYANzUQETHdIKpaDkBj2E5O7KH+ECTAuyuHGgCp5448hyWgHCiq3bXEwM/9kYv7
	uK3ma/Aid7pgoYLHwdt7I2kAvO0PH1i/Y4PL4GBtt9vAOhDp8+neYATh0GuPJDjzrrXqUEncFFk
	LuyvSU/XlCCLKgRP++6tFPrfZ4E81IJdRZtQFfm/2Bupx0sKTZnsbfPKGri8DxHAASidqUzSuQR
	4Y4pUviS3zTdIovlID1XP8HOOfTwugnB78FcWVTkxmBlSbnGWA3F/xo4I7rUWak0vtjiabUKEDB
	ssa1LSnXNOzmdqYJsf4Tp1Ilh8eTvm2yqF+COwNvkIRPGx7D1XpuhoeHGQ==
X-Received: by 2002:a17:907:6d02:b0:c4d:4d5b:4bd6 with SMTP id a640c23a62f3a-c509654df6emr656672966b.41.1794771334930;
        Sun, 15 Nov 2026 11:35:34 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:34 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	joe@dama.to,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 0/5] veth: link RX queues to their NAPI instances
Date: Sun, 15 Nov 2026 19:35:26 +0000
Message-ID: <20261115193531.57679-1-tianyi@cloudflare.com>
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

veth does not link its RX queues to their NAPI instances, so queue-get
reports no napi-id for them. napi-get lists each NAPI instance, and its
thread PID when NAPI is threaded, but not the RX queue it polls.
Userspace cannot tell which NAPI thread to pin for a given queue, or
which NAPI to change with napi-set.

There is also no way to busy poll an AF_XDP socket bound to a veth
queue. xsk_bind() takes the socket's NAPI ID from the RX queue, and a
veth RX queue has none.

Patch 1 is a cleanup to ease review of patch 2. veth_enable_xdp_range()
adds the NAPI instances only to pass their napi_id to
xdp_rxq_info_reg(), which no longer uses it. Patch 1 moves
netif_napi_add() into veth_napi_enable_range(), before the loop that
enables the NAPI instances. It also drops the napi_already_on and
delete_napi arguments and two wrappers.

Patch 2 calls netif_queue_set_napi() in veth_napi_enable_range(), after
napi_enable(). In veth_napi_del_range(), it clears the link with NULL
before napi_disable().

Patch 3 adds RX queue NAPI link checks to veth.sh. The napi-ids of the
RX queues must be the IDs of the NAPI instances of the device. The
queues must be linked only while NAPI is enabled. The checks run with
GRO on and with XDP attached, and across RX channel changes and link
down/up.

Patch 4 uses netif_napi_add_config(). veth deletes the NAPI instance of
an RX queue when it no longer needs it. With a persistent NAPI config,
the queue keeps its NAPI ID and settings when veth adds the instance
again.

Patch 5 adds checks to veth.sh that each RX queue keeps its NAPI ID.

---
Changes in v3:
- Patch 1: add all NAPI instances before enabling any, as before the
  series (Sashiko [1]).
- Patch 3: reword the commit message. No code change.
- New patch 4: use netif_napi_add_config() (Sashiko [2]).
- New patch 5: check that each RX queue keeps its NAPI ID.
- v2: https://lore.kernel.org/all/20261111015922.67745-1-tianyi@cloudflare.com/

[1] https://lore.kernel.org/all/179470883254.2199510.15270739408094114749@kernel.org/
[2] https://lore.kernel.org/all/179470883411.2199510.13825316417997386083@kernel.org/

Changes in v2:
- Rebase on net-next. Patch 3 no longer applied after commit
  c1f04ea0aa0f ("selftests: net: check veth carrier after changing
  channel counts"). The conflict is in context only. No code change.
- v1: https://lore.kernel.org/all/20261105143356.17062-1-tianyi@cloudflare.com/

Tianyi Gao (5):
  veth: refactor NAPI enable paths
  veth: link RX queues to their NAPI instances
  selftests: net: veth: test RX queue NAPI links
  veth: use persistent NAPI config
  selftests: net: veth: test that RX queues keep their NAPI IDs

 drivers/net/veth.c                  |  85 ++++++----------------
 tools/testing/selftests/net/veth.sh | 108 +++++++++++++++++++++++++++-
 2 files changed, 130 insertions(+), 63 deletions(-)


base-commit: 6964ff21c5d8b75649211a52dbfd92753e605649
-- 
2.56.0

