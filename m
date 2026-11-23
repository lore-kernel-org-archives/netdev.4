Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455684;
	b=ijgqGeZIeCDKMHXt2xATygSuMLGuVFMuMaXuKlG9oUyL+Ls1VX0dXP0ZWOnNtCoOaBvk
	 jVddtWHOUOJJPSDYnUuildGVouGD4JP36u4CFVa+8bvxnJskpehUNjItdNHlAFvyhc6X+
	 DYYE5/24U8t9gVbkuodVkqJg+EO47xGB0K8fL6q2k2DhGDawfElqtyCxYvG9ftPK5LCVM
	 NxsmWaCYh0yZ6ZJyGtbRwiFjm1rakK2iQFlmr6NjwLoHx3e1JakluD+VntTxQogrGUbeE
	 /pSfLiwICfxYupTp3FdAvh3xSfobEyHbvUzGGiBDMuzc+LcBCvL49aU/M2qQ4YdqHPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9bKjx+dDdqkrVyWGWMGq+GC1gV1zZDg8rCsvITd4h2Q=;
	b=JQ8Xfgv0rzjc43on42uFFZLPCS+MulSEU4XFg079bg96rU67mFySQg4mT84IwRjOb885
	 PkoMcioXCTFWiqPGZAtG6lMSu842Aglt/4SGHm9lOFDregap88QaB/jnHPBg1V6f10QH2
	 PsrA1YA/ljc+wwoSNXiX2vrfGnYADx5S/RrVX/gMNso4+YbTaFt0jZL9ylp9VzGNXBx+Q
	 K0XHVbGtMPVmDKQMKtEJYxQqif7Fp7fNz69dcy6Duv+QBQd5+q0LFWfpm9fq4biIIQwhJ
	 yQar+2tWG2qujQ7dfZYzmThr+S67IB6wKP+Hzfi86DAxkdPpByd5Uk+bBZtMFY0Oncg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xqd7QLpk;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BC7606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BC7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xqd7QLpk
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so662298eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455683; x=1796060483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bKjx+dDdqkrVyWGWMGq+GC1gV1zZDg8rCsvITd4h2Q=;
        b=Xqd7QLpkjPkq8Yop5RSTXQw8W+4unRv3Zu0TrEZUDmWcYovw1vjOOv176w1N+IpYcg
         wrsFieRAY8cPUr7Rwqsn/dfNXpUaZbFeH7rrzRSf5fFaqbqF5hItA7iNCk/jgsDjKhvp
         7uKB8a8plHvhusXX3WnrmrnauYs3WP1kNPWmng7NfrWtaxO4gXwZsGRJv3jHd+xuN/6P
         xmv8dy97B27dli6ULbSnABMzDpU1Pw8juUm5kkBGenOUkIGJ3NJDGDhwbMYwI4FVisxm
         Mw3YoeAG+AHB4O720wJrClJIvwjGmmBNaEg+V8wMN2kv0fkZMedqLLn/NmlSaIQMnILx
         aO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455683; x=1796060483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bKjx+dDdqkrVyWGWMGq+GC1gV1zZDg8rCsvITd4h2Q=;
        b=KPsn9efUccMfpSM6SXVzmVRfJOrLMS3HziaF6CsAc2Uui0sohE/tmSY25eR73QL4bP
         xR/QS/6/DpSpx25/gwsI7gNETpW3VFEt/vMbBB7VDtl6jkh3l6h62aGRCn46gBp5XQcj
         vHIctPuaRVvR5+yNOqF5i7l5zZMWnbk+0gGHwXKido/lnUm1A19uElK4RKNMMxCgVrYR
         x56Yh3hM3Y4533Lt4igGXnTaRHJTqFh4n4bt96cAW1u2tKguuqPiNbZKK229XnBV0J1J
         1KP+t4jD5RZ2UHmR3EtQ71QVFyGHLU7qRoDmm7uB0SGWpbmWkWWVxAHuGXpKrME//yul
         FMPw==
X-Gm-Message-State: APuU4Z88GDNawIpT9Qoc79aG6w7OC2Iy7SARNkKnuk5HHB1SdfRNEZFS
	8v8nV5tjUuUFT1sVkfezWivbmYqhPo/d5575aK8qBZlww+BhKhO99Osn4gmgMVnhW8I=
X-Gm-Gg: AZFdTZc6vq/rjfElkVZBJqSqqh04rJY+E3I1FL91z7azHK7TrmUfYdeDAcUs/NkCxdj
	DwON04PrwaXKrO9osdwMdSxJ47TvRFaDSgRhPzbCIQW/AbfoZuc4j5cEqULUWhNXRXQzYbFIX8l
	zO2BM93w3GV/vyu5QWh+RAIEvYwBeeg1cV8JOlAryvSbidWoeIeXQ5sJxseogfGnALzj5fqyM0h
	r/+1DvLSJOgNTkbPsfkEKBOilS7zGd7F2+LzjMw2+fXQDnE/VGhuP6KPqDXjkfrjV8IApTVhuZ/
	vUYPTwfeViAdwsfkFqaDdj9c44WSIrT+yHkTbeLAs5e53oOqS2oY3aub+bAW+51jlbpsbB2CFLA
	UQlqqWFXuIyppamYpAIIoIrv9quFhKOSxmBk1vQuZc7mwzOFvpeNLMokXBThsP0w8GB9WstCqET
	N0qzIfEvt41TTzIlyj4np4nzR1D75LtNcCJWw5DE9ixrk7/avwWk3fkIXkaSNX3V0t5CViI5Pyt
	zUxbnx+MrcHTQxRgZI4hwxtnpIwe/CYu+OkpDWzg1q9P22XJ2i35jRipLoaeDgZ9FOiGQivrJig
	b8OITUVI2tVJyOIPAtGbMMk=
X-Received: by 2002:a05:7301:6188:10b0:386:9ba8:2864 with SMTP id 5a478bee46e88-3869ba82acfmr7837316eec.0.1795455682974;
        Mon, 23 Nov 2026 09:41:22 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47478418eec.5.2026.11.23.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:41:22 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net-next 0/4] selftests: replace iperf with kperf and add RR
Date: Mon, 23 Nov 2026 09:41:16 -0800
Message-ID: <20261123174120.505808-1-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.1
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

Recently added iperf throughput runs (918696-924166) have not been stable:

  ktap-metric-json: {"goal":"higher","name":"throughput","value":99.60508305201279}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":90.65816851430006}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":92.02795621872379}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":98.78863365714747}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":103.38157195808748}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":93.64137239021106}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":101.73578035463773}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":78.15304223077422}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":103.79536587818043}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":91.48843017237692}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":75.27885187718259}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":103.5323033205535}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":92.04284599832805}

Compared to kperf devmem:

  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.588}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.63}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.606}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.594}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.54}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.594}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.552}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.561}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.616}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.63}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.532}
  ktap-metric-json: {"goal":"higher","name":"throughput","value":185.62}

This is most likely due to --pin-off we are doing with kperf. So replace
iperf with kperf (add regular and zerocopy variants).

At the same time, add closed loop RR stats to estimate the amount PPS
we can take (so I can follow up with open loop RR).

Stanislav Fomichev (4):
  selftests: drv-net: kperf: support request-response tests
  selftests: drv-net: add a closed-loop request-response test
  selftests: drv-net: add a kperf stream test
  selftests: drv-net: remove the iperf performance test

 .../selftests/drivers/net/lib/py/kperf.py     | 31 +++++++++++-
 .../selftests/drivers/net/perf/Makefile       |  3 +-
 .../selftests/drivers/net/perf/iperf.py       | 23 ---------
 .../testing/selftests/drivers/net/perf/rr.py  | 47 +++++++++++++++++++
 .../selftests/drivers/net/perf/stream.py      | 40 ++++++++++++++++
 5 files changed, 118 insertions(+), 26 deletions(-)
 delete mode 100755 tools/testing/selftests/drivers/net/perf/iperf.py
 create mode 100755 tools/testing/selftests/drivers/net/perf/rr.py
 create mode 100755 tools/testing/selftests/drivers/net/perf/stream.py

-- 
2.53.1-Meta

