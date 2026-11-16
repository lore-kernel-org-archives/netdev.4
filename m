Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794863487;
	b=1tU1VpCb3Fdt/GCWgNVVW9m7OD6ZE+ZKfCap3YMADdo1A+arjJLNdquYgvxoFX3sRpXG
	 qll+VAnraQF7yWE8eCQpi0MLfpFny5iC0jjMqWqLFus5dc118RINXZOswk5aRBn8AI8dq
	 nr/Vd+K2pH7okyamfwIGB9AyfvvbeuRgbF6aht1/4GL9RxEdxx8Jdi2PC6hKVmalIe+Qi
	 F035q6gRTmeCugjVn1ymdE4qHJWob0ADIWpG3S3tNQOopMfUgDhsWrtxepuj0bXzb3VXL
	 ZdI43FvbEz2SvVrKIw+mnbxstjZhRtLeNs+LdDFadOws35UaDoiY3PsB80UoDTNehFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794863487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=XFbDtNIiaC/OXFmr/Fpt3xn45L8867qAOx/j2uPNnQ8=;
	b=voFRefvSLiT4NTtsDKxep8tdWIHjbIbHZUEC7MpO0qGCil3KAXgeqxN6ti+ut9adykP7
	 bCGQaIe5wunPOxg6RwA1PqpquGYVetepntA+H2becdTlxzNAg5dpykwu4PKTsvuxEp5nr
	 m4AZqQUPgrs/HXDe2Q9Wxe3CZCboRKKrZaG3yPeAG2B7gKGSb07cSmhf40roQYCXKqA1D
	 dcAuGQt8xEdafRZGv12NJeJpi3ZIZvvgOOIzO4dJQ22EdvyDPFldIK5qZOayc2w71r+Ar
	 d0+uZKdL4gGnHpJgaQCCnOtlI/Mq9NGEw/MNMzAXTqCOw8/c7YHsSb5hfpmKkp5ZDQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PigPVu5a;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C51606A893
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65C51606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PigPVu5a
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b3a332105bso3918777b3.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 13:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794863483; x=1795468283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XFbDtNIiaC/OXFmr/Fpt3xn45L8867qAOx/j2uPNnQ8=;
        b=PigPVu5aOc0n7Sv0nAPubwWtrN3nEMv4bGM3O7JmsfN6q+4sozX7dzSzj99bFvmGxD
         cHctb0oUXag7OpeKEC/7qatGQim0kLxE9h33RRpX6j37O9Fim5Obiq6VZm24JokAIqFo
         mPKbx+ZDigRey8E2q99ryw6wJZi6PVwbusa4PVrORHxto71LQtFk0TvfYLYaGTVOAarm
         9wEi9vMKHr/I/tRUYhXgj4Pe+i4cWflKgx/WPGINQ70CURbBhZ1CZQzd+4Gzzm8uyQKN
         own4OB4OJ37ZlQO/7jH9oIVlGFaxMgtq9RErNfLFcqsmz3Sc1QYzjuB5RzdUJmPASbXg
         Ku3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794863483; x=1795468283;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFbDtNIiaC/OXFmr/Fpt3xn45L8867qAOx/j2uPNnQ8=;
        b=iTbk5eqMwmVRxMmOWvUTdNSg8b13bBh2Lmo+IqGv9TDvNOFl9LFpWup0Y2NBX0PXH2
         BZVd5wsd2ZWxmSbzeZW8cECitvonIB+j8liIB2mgY2vmf+h35kENhk91tLaMKiJE36k2
         V24OQn8VzcT3c5G53a0XtQ2Ce+ajxDsnObIK1c9yX3D4Zq5OVbz6q7LmPbyp+gKfUYdQ
         PfHQSXWAusfC3grq81L4Z0unwvdSEXSVm/Q1jRkkTEB+fopiTtpH4x4a6v1M5ew6qlB+
         1zlOUv48o6gQXavZak9W8OJ2gATaeR0GHC7D8nW4Nrs76E4xcgrLLgY4kDcFVYM3iKl0
         HZrg==
X-Forwarded-Encrypted: i=1; AL+hErFekktIxH9+4eqB4AJN2NIQbmwoKDgjrstwKG/LoMepq1HoX6Ous701IzJgksnI6Ah7lD/ZRcw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jnGIdoi1tA7sC9EtfSbxOSElHjXhc3sFNwR0Axx/EVC2IYfgz
	FtpC54mIhEzUfzv/aGr2WsaEbtozuoEAUIAdaKXU07tvBV1WnzhAmb8K
X-Gm-Gg: AZFdTZcAyf5N+wOL+xh/wuy0lUXPDUbQjqnT6bjfqrl5BgHxLseU4+KoU6AIe8KNKZN
	j9e2MmlEtYHAdTy1oyPEnWHK6GdNz6f7pYmF4W1MQPyE0FbqFOxgvGvMaYVJQykJ+zNFoRj3e+6
	UGXq1LzZic6dh5FIJFshL+BNgwzblEMS+wz5jlghPcAjBYhC7q6+b4vvXLqfekTfk89O/nnal7O
	JyIoVR644YRfterfdlyVYGtCoz5eDDcMKQjcUIzDBlUxddG4j+4UtvmHbSDOWKkNfpuqCtbxWKp
	Umyix2Py+qmahIUWSf2oMV5J+7bKZPdCZO+7ZWBTOqBTd1iZp5fEjEN5gv7uk24jBKKBbnB0bwo
	P+UlxyL7Otra2J7mnS75qrlJMFlm6tgvipnlFlo5OjGmvZKPI/rc4vyOcGJ5y9okbODBQQvVq99
	y8sF8P1sI8XD1EmqLVGulT3whg4HLu0dhkQhM8fG07yTPfefmyBpTqzoUaoArb09fdLbDCfHGqS
	Nl7DwzXAOTLUbYTAJJShg0nZ14Dgl1boRAsTAoGaDpGaZpUmmTHUiVyomMXvvHcpcaGGDtSLevR
	7rlLVe/QNBGmfnajbZv2w7ZQZ6c=
X-Received: by 2002:a05:690c:60c3:b0:8b3:4dd:5fb5 with SMTP id 00721157ae682-8b4ee348741mr4236997b3.27.1794863483507;
        Mon, 16 Nov 2026 13:11:23 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:41::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ed01d566sm7567077b3.38.2026.11.16.13.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:11:22 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/4] eth: mpnic: L2 address filtering
Date: Mon, 16 Nov 2026 13:11:18 -0800
Message-Id: <20261116-mpnic-l2-oot-v1-0-8dc6eb3582b0@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZx+2oC/x3MQQqEMAxA0atI1gZMwGH0KuJC2zgT0FTaIoJ4d
 4vLt/j/giRRJUFfXRDl0KTBCqiuwP0n+wmqLwZu+ENEjNtu6nBlDCEjT/RtnW+XbvZQkj3Koue
 7G8Ako8mZYbzvB69RCfFoAAAA
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Daniel Zahka <daniel.zahka@gmail.com>
X-Mailer: b4 0.13.0

The mpnic device has a TCAM that is keyed on DMAC addresses in the Rx
path. Up to this point, the TCAM was unprogrammed, and the default
action was set to pass all traffic to the host. This series programs the
TCAM to filter Rx packets based on DMAC address.

The device, broadcast, sencondary unicast and multicast addresses are
added to the DMAC filter. Promiscuous and all-multicast modes are also
supported by reserving the last entry in the TCAM for inexact matches.

The overall design is similar to fbnic. For each entry in the TCAM, the
driver tracks the lookup key, mask, state, and users of the entry.
Addresses are synced to HW in the ndo_open path, and unsynced in the
ndo_stop path. ndo_set_rx_mode_async and ndo_set_mac_address are
implemented, so the filtered addresses and promiscuity modes can be
updated.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (4):
      eth: mpnic: add filters for dev_addr and broadcast address
      eth: mpnic: add promiscuous and all-multicast filters
      eth: mpnic: sync unicast and multicast address lists
      eth: mpnic: support changing the MAC address

 drivers/net/ethernet/meta/mpnic/Makefile       |   1 +
 drivers/net/ethernet/meta/mpnic/mpnic.h        |   3 +
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  10 ++
 drivers/net/ethernet/meta/mpnic/mpnic_init.c   |  15 ++-
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c | 116 ++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.c    | 129 +++++++++++++++++++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_rpc.h    |  51 ++++++++++
 7 files changed, 321 insertions(+), 4 deletions(-)
---
base-commit: 7ccc5e05043b1bb84326b19a2b05938d8f7a2ae6
change-id: 20261112-mpnic-l2-oot-2a185cd5f9bd

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

