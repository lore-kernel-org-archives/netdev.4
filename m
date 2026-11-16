Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795529;
	b=ekfCyKLOGqdlfnRP6SX2ZwpUbOJUwbSr5bCLBBMknSbnAjvgrjaSqK6SS+n7jA+hWlJ4
	 W1oniKZ/qufBI/JkMBzQRms6QtSqBbwhsLei81SCE9IT7bKcETda53dSiPWW6j5BZu5zh
	 mwhlsejUbMTs0DGZLOpbQ07+aDby/V3dj2XyEMVM8QRD/2KKWVst780tAb596zvBdYsgq
	 D+yjXxjdu0VdrD1yK8rJ5/oz0JHi15DJBgNq7q2Rs6HFpTfQOfUr86UrnIf3aX0nMRNgQ
	 EEpYkoZTgVQJolcHUhMHE6o8rLAj1ycV/gpUjBlAblqrOANnmVD2KGiBtepdYzil8Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cmk9pDkg3ROe1phgCZGW0VVkU1Wnx5SBTcRmKjzsdWQ=;
	b=bQ+1axAHi/vK2GSvNB64JxC16J4QOHxy5vmrd2OpnTfvTVJXIctirLV8Z7v+qfWJT4yd
	 0Bs85jeE2jNP9WRCzpd2TYHSmFSMkmsGA88h0VXNrxOQ5e0fjJpeCfscrni8lZEASf6aH
	 RQ2BhahEkO0zJbBf5GgiF5XNrmupeMtEd139WktChc6RdRcKN+sDg/Np1epwBmNH00cZE
	 NM7HJebknnK2H1TPAJuSwIB6Iiez6T40UG/bY6YqRNorG7sP9E30jg+bb5RY+BuCVEbO3
	 5J3QScfef8lhyAFwlFKOIfv3amaI5DK64VoAtLKjq8efGLcMKWaMIKsNhM4PMP6ntBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ene5SdWL;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E6606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 02:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 315E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ene5SdWL
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd652c0385bso1841351a12.2
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 18:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794795528; x=1795400328; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cmk9pDkg3ROe1phgCZGW0VVkU1Wnx5SBTcRmKjzsdWQ=;
        b=ene5SdWL+cf62wRGJcjs6gpuy5nkbnz9Cu33hNv3dJGv0pv5jUG60Mgrbs7bm0ql4/
         N3nZ0DaI3KZ4caTYRhRFNp8vldhkIh9F67b4u+JwGoDC8fMuHkqBAm8kpUSW1JWo9Fbg
         x3JaGXnrzTI//jGjaIawWUGbbHAu8N/m1DjQeRUHBz1d51kqsHWV/8J5Y6QaT1GOpz0Q
         0WrGWcKwA5yzJj3CYpy0cWa3ZcrnzlvlVQmuJg6MMwq2DmgjFJfjD2fA26nrk0Tsc3d6
         Z12mUr2x1DdoMCJ0ZKB7lRH4DpCroo9U2u/J8bKYDZJak9UmVj+BeyT9L5H7zERvwGn4
         ideQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795528; x=1795400328;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmk9pDkg3ROe1phgCZGW0VVkU1Wnx5SBTcRmKjzsdWQ=;
        b=DEIxc1zy4+BjSIGGuFJsNAosLYyaYKl5iCYLESeVNt8FHhU1j6Qs+4CJvsORoBPteP
         O8HwlYVsoAhHSEtRXPB3gwsacrSWlDHtZVRNxyssX2NWeIby63UxjN3Xp48SLWsax0ME
         mXSWrOK7iFYZqUBLh70H8xZjQ4HwQS7Y+SfX2vdY6UeI5xDB5rMUHnzvrg49hKORpLgd
         ceEPQnFnJz11gIzYwLJsuPbYaN1Ior4K91Fw11RnuTs+zJQXBsojSrcLzZnDd3Pg2tF2
         kJHVYR49xwgZu62PbttSO7CsTKDzgOsG/cvzS+ZlbfR/6gdNYtjiJVoZy+yr/a8BXoK+
         2ByA==
X-Forwarded-Encrypted: i=1; AL+hErGoT/S8Q8Yh0iV1dkvaBzLxNHC8OyPpnTSfcRD5aYIHw0nwnq3N+646kN1WPrppUZnRyeAFxNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Igk8cUnVuWObgHMCYATISH8RcZXWjN7WFUhO+S1ERIRhhDc6O
	fAwUuZrCQ3ynFGdIIXbBZxcmp22ZPqOEofF2wDxWyKitU+glr+eXj6DJfV8S3qFD4RR/IIi4V/Y
	Nj/4Zag==
X-Received: from pjbpx11.prod.google.com ([2002:a17:90b:270b:b0:3b1:3416:34ac])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d87:b0:3b0:a831:5acc
 with SMTP id 98e67ed59e1d1-3b1b0a3a056mr8488927a91.42.1794795528219; Sun, 15
 Nov 2026 18:18:48 -0800 (PST)
Date: Mon, 16 Nov 2026 02:18:17 +0000
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
Message-ID: <20261116021845.2533130-1-kuniyu@google.com>
Subject: [PATCH v1 net-next 0/4] af_unix: Drop MSG_OOB support.
From: Kuniyuki Iwashima <kuniyu@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

MSG_OOB implementation is quite buggy and has received many CVEs,
which led to CONFIG_AF_UNIX_OOB, but the default is 'y' so it is
enabled by major distros, even though there is no clear use case.

In addition, such bugs have changed user-visible MSG_OOB
behaviour many times, but no one complained about that.

MSG_OOB is often used to upgrade a trivial bug to LPE.

We do not have good reason to maintain such an unused feature
and expose many users to risk.

This series drops MSG_OOB support.


Kuniyuki Iwashima (4):
  selftests: landlock: Replace MSG_OOB with O_ASYNC+F_SETSIG.
  selftests: bpf: sockmap: Remove AF_UNIX MSG_OOB test case.
  selftests: af_unix: Remove MSG_OOB tests.
  af_unix: Remove MSG_OOB.

 include/net/af_unix.h                         |   3 -
 include/net/dropreason-core.h                 |   6 -
 net/unix/Kconfig                              |   7 -
 net/unix/af_unix.c                            | 252 +----
 .../selftests/bpf/prog_tests/sockmap_redir.c  |  45 +-
 tools/testing/selftests/landlock/config       |   1 -
 .../selftests/landlock/scoped_signal_test.c   |  55 +-
 .../testing/selftests/net/af_unix/.gitignore  |   1 -
 tools/testing/selftests/net/af_unix/Makefile  |   1 -
 tools/testing/selftests/net/af_unix/config    |   1 -
 tools/testing/selftests/net/af_unix/msg_oob.c | 958 ------------------
 .../selftests/net/af_unix/scm_rights.c        |  45 +-
 12 files changed, 35 insertions(+), 1340 deletions(-)
 delete mode 100644 tools/testing/selftests/net/af_unix/msg_oob.c

-- 
2.56.0.611.g1030f0b940-goog

