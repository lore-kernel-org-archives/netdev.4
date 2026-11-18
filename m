Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983970;
	b=t22L43llEGDJfiA1kHYoNgh7B2oOM93AvByrOQ0HW3GFGrY5Ld0DKM2SE4Jt9BOBsXZ3
	 SRlsWfwtUakjWFtgafvgTAeaNqs/+/ulsb4eaHierpRf80/voYDMsbDrOPfiWOsDJ1LVa
	 5aYWGZRr6LHJFTRo9xX7OBbMtlgPrKTHUrG/I7LLpK6MGCERv7tvbmorObnBLxtvbuUpN
	 IQz9VI3ns5DygElFCozZKLouhro0p9aqzQ1bCU9t+kn7EN6kIWHvFm6abEbLuZqK1srIC
	 OtHxemwSg9Sn7xJaAeP15B+MpZbUuu03ANZk+IxBY1Qtl6OsXG3lrgRjQ6Fj2LRugWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
	b=V7Y3TFlfHlGqTA1tHlZeIP8HFnNamB7KcrjX7n3cw6kZbgXfSm7GjTlOmQ8qfrD02DOC
	 LPaFzNRcXK6U6CvJarV5oz33uMKpI/O/vwRHjWJkTY7D2YGk+L80U36y0/tiy3j+HYcvy
	 j3Iu0lGmGa+L/9QTq6hpiF782J8YH1k9AfJuJV1d2KakWTQsTEUbumQ6Y0BVFOfnMScq0
	 IekTPh0M2sCjW7zKX2zAFNN+8mu9jxa5VtuLRVzmYGjq7w/l2EWoV9KZXixTrFA2mzTxU
	 YfeZ0uIRbYzPhk65RrxfFag+7/P/wNO2D2lm/s+ElsMnq91Pokb83gJREp4qIPYsQHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbxSF1Cp;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3842B606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3842B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbxSF1Cp
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb2893531bso484236a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794983970; x=1795588770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
        b=EbxSF1Cpupu10/hGoiSCTVs35XFe/p0DNId9GVw+zqqQ1g2CFmVNipzSdS7btmYBz/
         gBDabXO+4Ro+d5+s/eIQZwxKGDgkQpAZ2sToN0Jl4Qwuh2om3GfROG8c1Sxxbxn+XccU
         rv9l9ck4IFGRqR2qlPcSoQl8v31CO/DPtVvoKTudcOAyXRptzxM/0MOgIaqVRZdSWa7F
         m8GjYrHL14fZJI2Z/K1U3dbNiEAJgKSKj75TybxsTQ5Q8uMJY05dwBLy8JwoGBDs9gTA
         kMWSRwKQfvwxw4L0sjqIQioA9mqXlw7pbFmOJD7xFLBZu0c8IK9q7+2SbigCYXgGV0qK
         G1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794983970; x=1795588770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAcon0bPGB/oOjy8oTqDZo1BhwkcxrdxjLe278WDxJ0=;
        b=2BTxeOMrrxY9p+ivQAh7zwyezPgxQIKjXo4bglAnqLFxnyqEhC4hJcrZ7hg8UQWHWj
         oBfIkGozJSvwoDoDduNBfN6Jw0vmRYuLc4CJzNOiQbdduS3q8oXCnNRs+WknlTYTfkYE
         BT5WOPRXK5X5jLwHIaHerxtluY/HRM3QYi/29xaOPr9bc/m+50f1y9ZcgS/phpFz0VA3
         vjqFldeI3D66RO/wsKPcItaGdyw0BfZA9jUgbjRGXZHW9elFrDKOLZsG5fvmw3VxwDGS
         zN34hU6U3i+pi1KJAGILDbO5FkTJihpx79XJwBgFNd4iTt9Wg5mfrur7j47b/sPfkq6d
         VXSQ==
X-Gm-Message-State: APuU4Z9yXilUJ4Zs6wT4vKztotkace6tifEKW+Ceg2ULBRfuQf/baGIC
	/GkyeCSByfI8Jc7HYRzqzVcO8oeGLR2r/JOVnpNPwbNZeQgyu8HGZLb7Yt4+fYOPuq8=
X-Gm-Gg: AZFdTZf30uBUuwNZGE0Vw+uwYHfqKmz5IrsaZh7A1/9ad4N+ABwWCDU6GOnL8K28zjl
	kYmUvefwf1B73GJd7pDgAotsQffjsxQkvLiohNeIzhekfbvm2tgRLCYROwfeK1I2kVU/wS0Mch6
	UAwGdWDeg3Q7ocm7nudCr/9VgM8SstOwLW8m365w74/zoInULEw4OMS76MH9mpoWfavGPCZ3LBR
	TuWSw1DrMFVxMj/HiKiFoJRJIUcnqM5oyX1xre8PkSqT5piELVuSoBohX2ywT+73VY2mjdjWm5N
	TMwW7YK3JEtMYGARUpz6eqLhqryZlBCDT16EtVtzSPz78Fpe21r6qvmZQ2SEGeJZ1YBi3Msjr7e
	o0F5JBg4RB8puztu4vHdkAaAyJM+TKW8IH/wvI+g4C3FLnyL3aF3FPMeHIM21Z7gxgIHx0LAQWD
	KWVEN8qrfMJ2Qww0lF6gCUcfictZu6wVuu3Lm6IXybMiZuCezwmvWPbfVxSLVnSSfLhNqpCU4td
	kzt6HSFN5/YtQFzLlOg5GHPt8xs8veWwSkVXZ6NlNF6Vhl5mrOfc5l2TIzXormpJqow115FmRjQ
	sSerBpn3r0lb0pFxmko7I/3o34EpL9Rkk+MiYqcZlacItwCviL9qtGVYnxanK9MnVx6xwtfALhz
	jHhTiwgVzUbklYonnLCbOHSk6fH8sF40=
X-Received: by 2002:a17:90b:1cd0:b0:3ac:b7b9:6471 with SMTP id 98e67ed59e1d1-3b3d07d2ab7mr1602445a91.65.1794983969538;
        Tue, 17 Nov 2026 22:39:29 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([104.28.235.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm2562322a91.15.2026.11.17.22.39.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 22:39:29 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: netdev@vger.kernel.org
Cc: jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	koen.de_schepper@nokia-bell-labs.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net 0/2] dualpi2: fix queue delays after trimming
Date: Wed, 18 Nov 2026 14:39:20 +0800
Message-ID: <20261118143500.dualpi2.0.543a9a1be910-zhiqizhangg@gmail.com>
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

Changing DualPI2's queue limits can remove the cached head packet without
refreshing its enqueue timestamp. This leaves an increasing delay on an
empty queue, or the removed head's delay on a partially trimmed queue.
The first patch refreshes both cached timestamps after trimming. The
second adds regression tests through the net selftest framework.

I identified the issue, reviewed the fix, and developed and tested the
regression checks with AI assistance. I used OpenAI Codex for root-cause
analysis, drafting the fix and initial test code, automated validation,
and preparation of the commit messages and this cover letter. I asked
Codex to analyze kernel code, implement and test a fix, check public
reports for duplicates, and follow the kernel contribution process.
The archived results below are from Codex-assisted automated validation.
I found no matching public report or patch in the upstream histories,
Patchwork, lore and GitHub searches performed with Codex as of 2026-11-18.

I used Codex-assisted automated runs of the 11 companion DualPI2
selftests to validate unmodified and fixed arm64 net/main kernels in
QEMU, at the base commit below. Real AF_PACKET traffic was retained with
HFSC ls/ul shaping on a dummy interface in an isolated network namespace.
No source changes or fault injection were used to trigger the bug.
The baseline passed three controls and failed eight trimming cases;
the fixed kernel passed all 11. KASAN, UBSAN and PROVE_LOCKING were
enabled, and the completed runs showed no corresponding diagnostics.
An earlier eight-case standalone reproducer verified the fix on mainline.

I used Codex to build before/after arm64 kernel Images on mainline and
net, compile the modified object with W=1 under debug, allmodconfig and
allyesconfig without new warnings, and build the selftest helper through
its Makefile target with -Wall -Wextra -Werror. Both patches pass
checkpatch --strict, and applying the series to the base
commit reproduces the committed tree exactly.

I also used Codex to complete full arm64 allmodconfig and allyesconfig
builds on mainline at 7ccb044c27720d48175577080b851f047ddcfd1c with the
same fix, using W=1 and CONFIG_WERROR= to allow baseline warnings. Default
strict attempts hit the existing arch/arm64/kernel/sys.c override-init
warning promoted to an error; the same failure was reproduced on the
unmodified net tree.
After the full builds, I used Codex to rebuild the modified object under
both configs with default CONFIG_WERROR and W=1, without warnings.

Zhiqi Zhang (2):
  net/sched: dualpi2: refresh head timestamps after trimming
  selftests: net: check DualPI2 head timestamps after trimming

 MAINTAINERS                                 |   1 +
 net/sched/sch_dualpi2.c                     |   2 +
 tools/testing/selftests/net/Makefile        |   2 +
 tools/testing/selftests/net/config          |   2 +
 tools/testing/selftests/net/dualpi2_head.c  | 304 +++++++++++++++++
 tools/testing/selftests/net/dualpi2_head.sh | 350 ++++++++++++++++++++
 6 files changed, 661 insertions(+)
 create mode 100644 tools/testing/selftests/net/dualpi2_head.c
 create mode 100755 tools/testing/selftests/net/dualpi2_head.sh


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)

