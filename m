Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968900;
	b=BLMJTzsh4Ocaple0c4QgkfpouSgG3t/S0TKP3PrkURqSSfBZzyUJlXT53v8FI3l342Wd
	 24CbP/kbFMsji51ijGcwpA2ZsN6KovlaV4oXVFe3h59moV5KasQbNSl3aptnxy8EUOzE2
	 0jlCTf+L2CrhL27ggPnA54ENfbvMw5zn+BvxqE/58H4AYWTsfg6uwwxF/9vQsJ/IE8E8o
	 +qNwDu0IhVFMAvMx3vIKzfz2mII4P4KbSd09bXV3WOiKCaqUIfhr8/IpkZRs1pBg9v1HL
	 oNyhF5XGSzKI0IPv0P0xgWYtifs+x88EGMPxN9BkD330L5cKhaIkVvnD3N29K3q3heg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
	b=uWgnGwnYPW11PboTulpja/h9Hw9/o7U76rZ7EyLlVl9frEffshjXTQG9RitMKFeM04y1
	 fTYzvSK4EoH4MFhMWswqkmDDSR8nq0CqBxqJrJtkZOW+OPozUnFA/zHByRH9MUmaxnIEu
	 oHh14Kf3W4tHuBYlQSuD2xsYeAFsPBkzzDnSRsbncgh0ATtRK9G9bVZtMr8bUwvLWHxzu
	 1URRQEVO8E5lJBdA7mIVLBDABrp+5cwybcJHlcmfiG+ucD4ZTqQodxx/4ctzd00CETfmA
	 f1QZxjKaTyYYRFd6okN+AYEgMTWNEK/rBeVprQb4s87Y9Iqkx+GQoxkJPz9TYx9WcgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfnD6CrD;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A7606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 787A7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IfnD6CrD
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso3282565ad.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 18:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794968900; x=1795573700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
        b=IfnD6CrDsAMUkk3Wmlw79A10NLxrndNMXRede91i+PMYlQ6UxlCc/wEKS86x2VRcBs
         ELbpQgwL4eS3jvxLIlVe03/VbCpjs85zTmBawmM7kkJqUY6TsT0ABq1gnL0Jo3V3TKUf
         f274JqEjdeGqoFuZfDkrM2+WIMXd2L/rMxga5asPktqPWuegCJVV/3soYR/vFI7MgsvR
         6oRAJWiIMzODUrRZeYyfyrwX4yMwDGS8kz82Kp+ovKFydYPachZjICuqDlK5dZly0H1D
         R/TRCRA3Lms2UKmFtyXhpQVzWPLPoNg3nONno6ebKgXoeXy9ySWd6MNYSJWotAomKgr9
         4uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968900; x=1795573700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBM1tckyz85/mFdKRLmUacT5H4u3cjM1OdFw/h4C7tI=;
        b=cWZlMiwvSuipd6E7PIkfHiC5K+BddSw9UELRsVDvCLl6U2KX8o3Dv6SVah9jC7sHoM
         ExeaOpHPWZ79lJrAbKKebeDHg+AR3MFQl+rEYSPt9GkTwVXCQL6m2THANN9lQ0p1FGhF
         +o70T1PkTkEjHBCW7ItJOuOunzoil3qTPuZ9UsNKUN3stu8sRS91SSWxcjlgARDk7txW
         O96oMpusJH4VF9m6UqAHri1z10x5PhceH9PZr5Jo1pGHQlig7Kl+2lEkWG7OOZJJoaAK
         Umk4YAlar2JbSfDDQk9Xy2AP89LhOThyZhQGQIQTNi/g2yP9m1slMgBycTl4roPptaSI
         ldOw==
X-Forwarded-Encrypted: i=1; AL+hErGu4s6JtTd8yBGzivgBxZV+m6q3ExLEmdCQHngpygIZu2iYO539cf3Qv3bFTNcpJJ0bKn18g2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+un2yV9oQc+4tAM2Mt2f+ul6pSLVWzb8Vdp/yU0KDNk1qUgFlN
	VEQFdKxCzmHQv883nqC2C07Z63QSdHZf2Ec7cbUf/afphCOqYAhd5C8N
X-Gm-Gg: AZFdTZcKY16MOxtxIZxL74rprKDVpvM34SfWOWOcMvJmex3lJkzTS8L/ENxBnzHcyXD
	6I5m4FbExDEljj13vlBjwQykBImlmhU9/KFgjYlTwdMtbYAZrW3QBXz+9Rj34Fn5UAeDx2Xvg1Z
	Pcd7hmuQjYmD7s/KiGdMjaGaHHobfTuIQm9zFkhtfeT354r42XLKATiTD463vIb1Y6BcyHC35wE
	8yirO496Ruu0IyWve/9kZsQfY39jtQKxTgS6rWkWYfg0ElXR9LI8hTfh7V0oyTeL4GiF6AFWRhY
	3SzXU6oPMzosgrka0H4wMeZzS1Je9Ai1ooVOivfKWLbnnnubX0EUvfBkF6+MTdsyBpTFsS3xft5
	CJKBRJDoXZWgtJ5ZAebth4AfdNnyTfpHVF8QFXS9RpMTsnhAy0dEQhYEuVS+KMmqMUf/KyMJO59
	odL+vkmfAVXqwyGuffC9QUtPVz0dzYgXEK533HfiSVPYUu/pcS6xhFE830SLGdKEXWX5P1t48n7
	aPHtpWbYnZrH+aRe22NtrosxHBXhEHDQ1WKY0cbPCmytL7vkxQwALn4dcgUrl9kAo4a5+bwCf4V
	yGSaiux0huFq9A7qMfkcyGHRMrtU5MXjNQ8itcyv5bJWhVz2eDk0HqSfMw0tLodcCYafinFZ7y7
	z/IqT3vYv67JU2gcSfuegZHA=
X-Received: by 2002:a17:903:32d1:b0:2e8:18ca:5f46 with SMTP id d9443c01a7336-2eff72e6095mr11400325ad.14.1794968899679;
        Tue, 17 Nov 2026 18:28:19 -0800 (PST)
Received: from message.eml ([2a09:bac1:76e0:450::21f:e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff617f8cesm4756605ad.27.2026.11.17.18.28.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 18:28:19 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Eric Dumazet <edumazet@kernel.org>,
	Neal Cardwell <ncardwell@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tim Fuechsel <t.fuechsel@gmx.de>,
	Lukas Prause <lukas.prause@ikt.uni-hannover.de>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/2] tcp: roccet: fix idle restart on RTO
Date: Wed, 18 Nov 2026 10:28:11 +0800
Message-ID: <20261118022813.9778-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Patch 1/2 skips the idle restart when packets are outstanding, so an
RTO retransmission no longer overwrites the snd_ssthresh preserved by
roccet_state(TCP_CA_Loss).  Patch 2/2 adds a packetdrill test.

v1:
https://lore.kernel.org/all/20261114141315.19007-1-zhiqizhangg@gmail.com/

Eric's review:
https://lore.kernel.org/all/CAL4WiiohBWs_BteL4o__osD6cPTXrBBPa-P7faV=acTaF_4g3w@mail.gmail.com/

Changes since v1:
- Make the changelog precise about when the idle restart is reached:
  with TLP the first RTO is affected; without TLP the first RTO can
  escape and the second RTO is always affected.
- Limit the claimed effect to tp->snd_ssthresh.  roccet_state() calls
  roccet_reset(), so ca->state is already LAUNCH and last_max_cwnd is
  already 0 when roccet_cwnd_event_tx_start() runs; the idle restart
  only overwrites snd_ssthresh.
- Shorten the comment to the style used in the file.
- Add the packetdrill test from Eric as 2/2, and enable
  CONFIG_TCP_CONG_ADVANCED plus CONFIG_TCP_CONG_ROCCET in the
  packetdrill config (ROCCET is only visible with advanced congestion
  control enabled).

Patch 2/2 is based on a test written by Eric Dumazet.  A variant with
tcp_early_retrans=0 (no TLP) fails at the second RTO only.

Testing: Eric ran the packetdrill test in 2/2 (it fails at the first RTO
without 1/2 and passes with it).  The netem reproducer from v1 still
shows snd_ssthresh being preserved during the RTO with this series.

AI assistance:

- DeepSeek (deepseek-flash) generated the code change in 1/2.
- I wrote the netem reproducer and the documentation, and reviewed the
  code.  The packetdrill test in 2/2 was written by Eric Dumazet.
- DeepSeek was used to polish the wording.

Thanks Eric for the review and the packetdrill test.


Zhiqi Zhang (2):
  tcp: roccet: do not restart from idle on RTO retransmission
  selftests: net: packetdrill: add ROCCET RTO test

 net/ipv4/tcp_roccet.c                         |  8 ++-
 .../testing/selftests/net/packetdrill/config  |  2 +
 .../net/packetdrill/tcp_roccet_rto.pkt        | 63 +++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/net/packetdrill/tcp_roccet_rto.pkt

-- 
2.54.0 (Apple Git-157)


