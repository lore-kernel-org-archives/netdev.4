Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853224;
	b=zcx87/Y4sVpmcptOsa2jR3KGn4fiW9gE7Lc/bmoPm3Veh+anWjtt29UswBghAJxRDQb1
	 04b1ZxHWkeGI58itSJ15qQIvXgA4EsUWn6P2ACdcUl/wD2kgZH16U1l+bqxDEQeMpFqHJ
	 0SQsIRsMZRjkcjN3NjTCxyKIelUCAZt/7wpHBwPDyh/wvb3F/80foqRPJzY2/nypQF5v+
	 F0Z0VxuhuD9apnXZ/MrDyErcUrrICF8oVAh0yKehTvDBdG1QdVcoU9V+BvtW5wgevTOz7
	 WHdYVKPabHA0nRRILIdlDHUXY9ecOjlo/BTofJNNaIy+qIKONYuZPOfDweAqi9YXwJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cyoJ6bqjUJRNjPoaAZeJQ/eJ6I8Hzj4D16/Bh2mONSg=;
	b=2VgfVYKWXOBYhZwLAaK6qshdllQQrQsHkAnRfSMuD5Evqdjs4tcNROpzWs0Zr5KLNV9z
	 tPaskgbqnXLJTQ37TU1/psXfuN0FsOv+GJ9Lzq9TSsyLVe4LmCMBt3rMI+cSEmozUKXXD
	 msZ69J5bXAHReJRbDikAZzrLjy2EId3KmxrYC0F2fDjBLuJGMTZAbwm3zsKGrYOmLoN8l
	 +qCI405K9vq4RUqbmJbATvJItocLCBDmheUQY+gQqRlnbJ9FHpZNlFe5AngKbx/RBS9dW
	 68ahdCxGl4bY5yU4BaOFx2MujHwIosUqYZ9ECkjg89yHa/h8z9bjGT/8sTABiGMrzyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VrLn6wjq;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE289606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE289606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VrLn6wjq
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f033dc37cfso82414385ad.0
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795853223; x=1796458023; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyoJ6bqjUJRNjPoaAZeJQ/eJ6I8Hzj4D16/Bh2mONSg=;
        b=VrLn6wjqLO/OeKHAPIOATvgWpHcKXdSdKeE5MUWfBZP5oGD+UAbDWpTz4mKQ72AMjS
         wi/wnMzYB1GvdcEQH1cOKAbNG2ZA3+E9n7YMRAMCCLAAhQts7CPLDuVc07GprzWxy3hr
         JHu0K7X5qYGh00639MGnL1pc7BFwP3mj9jtR8cbqhYSvH8JOitMETjTXsI2FN08ZIh+i
         T7PsEEnhUhjOo81wui2QW62MYJ3CaB/TLYljTJgGsNVNgbCh0H0BkmZlzHMhvIm1a9LZ
         tKp4/PckPVU0DVMEyBaamNYRVZeYHvcH0UYw3PYxme5rjsyEmy9rRdkFUd1F1BzZ2V1f
         Wj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853223; x=1796458023;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cyoJ6bqjUJRNjPoaAZeJQ/eJ6I8Hzj4D16/Bh2mONSg=;
        b=TCgOn6Now4M4ptIs83X1LUCdHhWGmt9GVtaAArscRsOhTAgNZ3S2/XyNo/4FRQv+wO
         c17n+Z2KT09PUlZTXi30DEITAioddyLri23Je90qERWGohEx3EQYRs/Gt3Z6cABExi6D
         E+PR0oCGv1ehz2VbIrmW2JmZM9Ee1vr7B8U/464ddTzKNpHThBDCMak2l6M/pJlSyRmE
         ZEDJhD5tOxXuuIfPQIfQLdLpXkDc8VLdvGPOX4WH8VMEHFq3UCeW5Y8GxJUorn0pN4nX
         +XYH/poS/Ht+sUdiQuKhfhmWo0WHP5ERM3cdAcIzRIiA+cqkNvHDvbhhmsKNAtYsSeDV
         ZW7g==
X-Forwarded-Encrypted: i=1; AL+hErEBVSYLxnHbXlu1o9TWdofPRxS7GuEGRnYwDeak98oSeTCqW54CK4lsE7NS7ZYpaYoCn+RiEnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EA7XygNC/5qTF8XsHNcISVmZ6MIfNq0olWbG+OYMjStgB6aiu
	uGoQRowWdaX4FtgdF7u1OdaEd64csIFGwCuRn2lB6ZsYY5hWYyzbcfThk7GJshkV1UlMDDUiJSc
	ak/dlDg==
X-Received: from plbmf15.prod.google.com ([2002:a17:902:fc8f:b0:2ef:e9a7:dfde])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c443:b0:2e7:ff72:203f
 with SMTP id d9443c01a7336-2f03f1a52b5mr176209335ad.61.1795853222905; Sat, 28
 Nov 2026 00:07:02 -0800 (PST)
Date: Sat, 28 Nov 2026 08:06:12 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261128080700.3828378-1-kuniyu@google.com>
Subject: [PATCH v2 net 0/8] tcp: Misc fixes for tcp_v[46]_err() and tcp_v[46]_rcv().
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

A packetdrill-equipped LLM found a bunch of bugs with repro.

This is the first series fixing bugs in tcp_v4_err(),
tcp_v6_err(), tcp_v4_rcv(), and tcp_v6_rcv().

Patches 1-5, 7, and 8 are fixes, and Patch 6 is a selftest
for the bugs fixed by Patches 1-5.

I'll add tests for patch 7 & 8 in net-next as it will be a
bit large.


Changes:
  v2:
    * Drop v1's patch 1
    * Add patch 3
    * Patch 1
      * Mention ICMP could be dropped if sent with the default 64 TTL
    * Patch 4
      * Change not to ignore hard error instead of following RFC 1122
    * Patch 6
      * Remove tests for v1's patch 1
      * Cover more ICMP errors
      * Use IP_TTL symbol w/ a new packetdrill (NIPA already
        support this : https://github.com/linux-netdev/nipa/pull/143

  v1: https://lore.kernel.org/netdev/20261117053543.84032-1-kuniyu@google.com/


Kuniyuki Iwashima (8):
  tcp: Don't use inner IP TTL for IP_MINTTL in tcp_v4_err().
  tcp: Don't bypass GTSM check for reqsk in tcp_v[46]_err().
  tcp: Don't bypass GTSM check for reqsk in tcp_v[46]_rcv().
  tcp: Fix reqsk abort condition on ICMP errors.
  tcp: Check ip_sk_accept_pmtu() in tcp_v4_err().
  selftest: net: packetdrill: Add ICMP and ICMPv6 tests.
  tcp: Pass inet_sdif() to __inet_lookup_established() in tcp_v4_err().
  tcp: Pass inet6_iif() to __inet6_lookup_established() in tcp_v6_err().

 net/ipv4/tcp_ipv4.c                           |  39 ++++--
 net/ipv6/tcp_ipv6.c                           |  37 ++++--
 .../net/packetdrill/tcp_icmp_ipv4.pkt         | 124 ++++++++++++++++++
 .../net/packetdrill/tcp_icmp_ipv6.pkt         | 124 ++++++++++++++++++
 4 files changed, 296 insertions(+), 28 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv4.pkt
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_icmp_ipv6.pkt

-- 
2.56.1.839.g22a8290db9-goog

