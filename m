Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672784;
	b=pcBV0aSCfhV46t9TN2GoftD7l6CzcvQ1RdpW8EJ+gSGzkjMMrWC1uBfk9btq8k6nL1Ix
	 HoRJX8dbamaJhdT6fR61xjp3ruaCuoSuGpQhYZs/vs46X6MWJkzpUrjJuhCuZPRFxju04
	 vOCA9J/5HyqZEqk3ElR8e36vA1tr1zcYdrB26+dEIbv4II6Q2pPhBmlgQPctFOkWS0MPs
	 n4F8yAbbrFDNL+/Queu3gUewkHSzCAXIQ9sPf2rZjQZf16k/YEE/+LywVGBbmTAiermds
	 ZIi5sMno8J6Ng71twQ89fqXsEYDQUL8w112ND5j/sBzJ0+RWz6lcN1uOk6nRtshw+DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=UvTFqc8i3xyEhBMWLvMQamC41/wDFIIexgs3eOodVog=;
	b=Ron9r6jtT9Hgz3O5ruDy7Gpiy9jcMpIwO1tkIXwMTBxQ1/C8s4FixC1O0zRSTqmO7/F9
	 /AShaytOwSnSyEciUVG0oCmXov+W1LRPL6u2OPe2XP/9os+71tL74lwI0nNo1lRMlF9aP
	 41Q3KHcupDpnpFgMZFAd0GYZaeVIokdiXokbT39t2mZrcFXuE94jkr8/4sOVthfYbgt/a
	 8EWSTmCOwG96vY8Xx2OS/Yzhjc7vMm1XNTyAmo4rwv+gdcUSZxJ/GQRM/OrfFKiht+s8Z
	 8+m4BVqKtXjskvueihfAtNvcYFKCnM3LCjusBdBzi5rtLEuTUrYez67ZzZZLF0spPGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c8HPKNYE;
	arc=none smtp.remote-ip=209.85.222.69
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F00606A8AA
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F00606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c8HPKNYE
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99076c676cbso345591241.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672783; x=1795277583; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvTFqc8i3xyEhBMWLvMQamC41/wDFIIexgs3eOodVog=;
        b=c8HPKNYEmcHOl3IwX4ciUm1Q6JbHB6U7VIWphFKKMIZtXKciUK00PgjJ/KuE8gAE25
         l/Itm4h5f3A6xVkzCCo8KYJPdwSIZWnlE7EKOF63+NLvUE0i080hQkg3kk8zfXcI3V6F
         PALW6n5s3I3TgzLMYpoeTSRXKs6n858IISTr5QgS3bJyHz3VTrog51f9wM4lUMt3wj9V
         pCqAn5MKK/2HsBromVQoNuk9ttqii0BU15nqPSs/eaYAdh3GGh7M9IHehgXhD8XUBfOd
         yPKBv31VYOr10MHFUWQJFuhKszM5nnLlzJC2xDxQ4tFDouQCYxAJ/Lz7FhhgwfZS3PM3
         PLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672783; x=1795277583;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UvTFqc8i3xyEhBMWLvMQamC41/wDFIIexgs3eOodVog=;
        b=TPyFT7xUg6lvuVJYOwXk02d47ei9z79A6pwbcQRcV7D0TbWIwEBShfjRzEHXJF12AI
         2gMkgZzHY3BDug/kEGWZFZ/Yho6ydzl53WTMLemXdTMgaM5MssdxsfHn0sh4qMadzuVd
         tgWqsuQALiQccwuRGu/DuBL/zsltf4C7tNoRIn20tgbYS50eYS2/eX0CeA7gNkVawX+b
         0R6xq1pvbJt1pSpngTpyjf/K5SDjENH0uRBsSlBmPZvlglmWfaq+M4kIwcBESMmneefo
         nl7MxO/Vnfj+2om8gR2XdDI+qHDn1uIZhfGkhX2LtznLyVGzG9GmglCQgU1OER9Vu6R7
         mgXw==
X-Forwarded-Encrypted: i=1; AL+hErEC9cq3a27eKSR902lvUUhOa4krGeoWOOhAyIOOVtCWbtj3ti8hpjqx6MpZ/Ku0GW5f1xMlVl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CW6t8Y8QtbI92kVGTGoUapEeogRgj+gOpxXnjvQzvvjiQLLgK
	UqVJ4fAwisEuAYySuv2Hy4Iw0xuAQn4NdeGtVe2CaBN1PxY5Cg2A6I5Dom/R3QxZkTpg5gDqt9Z
	AOUscViAAU9MOJvQqUAlUhCwe8Q==
X-Received: from uapd15.prod.google.com ([2002:ab0:724f:0:b0:99e:d09:7f0d])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:3594:b0:7cc:2cd0:e73c with SMTP id ada2fe7eead31-7d64d8196f7mr2244002137.25.1794672782484;
 Sat, 14 Nov 2026 08:13:02 -0800 (PST)
Date: Sat, 14 Nov 2026 16:12:46 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114161248.3428695-1-thaisonphan@google.com>
Subject: [PATCH net 0/2] tcp: initialize missing request_sock fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Cc: Simon Horman <horms@kernel.org>, Stan Iliev <stani@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Initialize missing request_sock fields for TCP connections accepted via
SYN cookies, where cookie_tcp_reqsk_alloc() and
bpf_sk_assign_tcp_reqsk() allocate without __GFP_ZERO:

- Patch 1 initializes ireq->ir_rmt_addr and ireq->ir_loc_addr to
  LOOPBACK4_IPV6 in cookie_v6_check(), matching tcp_v6_init_req().
- Patch 2 initializes the AccECN request_sock fields in
  cookie_tcp_reqsk_init() and sets syn_ect_snt in cookie_{v4,v6}_check(),
  matching tcp_openreq_init() and tcp_{v4,v6}_send_synack().

An AI coding assistant helped audit the request_sock initialization
paths, write the QEMU reproducer, and draft the changelogs.

Thaison Phan (2):
  tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
  tcp: accecn: initialize AccECN fields in syncookie path

 net/ipv4/syncookies.c | 5 +++++
 net/ipv6/syncookies.c | 4 ++++
 2 files changed, 9 insertions(+)


base-commit: 19ec8416a76c08326fe5f814410a1b43046e63be
-- 
2.56.0.611.g1030f0b940-goog

