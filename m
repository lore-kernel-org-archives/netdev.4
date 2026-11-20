Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212219;
	b=Xcu9IvhmY+Eb5FprxCCVLgz5ldhMvNP5F/xRqD3iOD/fhOergYheDAUFJXOuKNcbZI+V
	 OJdCRydJaP2x5AguWBa5F6gWuXs7jbl45nH7lhnBEMegCvGU7JejSWbqUk4jbaK+c20RT
	 eeGCTvd2SbQRM9SprYR6Ow3NCmv+9BxFm0t+rjF6F9NIo7FTTd3lgmDiMhNG5Xwy4CL3/
	 GqrCGsaUUJIiwKdn0paaOse94lp4/w4X7T/xS224IOiXjxUTdJChqfKbcDhGiPe18L1m8
	 +NdZotMrXnNlTVaS9IDBvP07ugJ9zECBevdG1s9YvVI/BfvWz524JprwKd9v/RBjCcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
	b=Y4SrWM3TngDFG/AInfl5+wvulQvOQlNR7CT+NyNEipjqYi9sdZOwfdQDdR9iKgY5v63P
	 rsH83jql2z6tJKJ7fD/syiDbk5jhrRTTOP2cTVAqBuwoCHbXpUfOkGd2AHKBCq5eT7Um3
	 efeX1WQDxsrSukTCbfDC3n7+HjujWdO9uYM50vjsFcpu6hSMZ9DjYPwermnPEFn3RCs4x
	 RADQhgs6PXHuWvk2k15uSolvmI/pFTCi/Vq2/HRVQJqAfZkUPcWA10hNVvaLoo1A6hELG
	 qw4Q3iNoNrx1Na4eu/qs6DBKFt/oQDtRgoZAo88Ccu9TJqUmRuj+w43yKFhBHFOZvAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOr5oD3+;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1E5606A6A5
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1E5606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOr5oD3+
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso11517605e9.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795212213; x=1795817013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=gOr5oD3+13AfWWQTSdFX3WSjjiYlo7c+u8wQ1CpkBAAkYZiHLLdq1kJqz6dWoUFll4
         C1RBB6n0tqmGlNxVAsLs7iuZnWNpLZurwoVPpz21eT+RBA7McTrgbgvy6C7GbelsSc3y
         ypNIFpDYCBppbKgTn8aqp/Y5wa4zdhsm+N1OaSfeCvRCN4fh6mvLvNp0FIDd8tuU8fLy
         ja4Kt6KPmeFNQSKjtu/Sfqd73q+HxLFUQdf6H0ad1TQhO7LztHL7NXupIvdU+PAptgvp
         v4/d/dGFiYBPI/hzuLYytMdzt0BA/YpVi+bDxjZcLZmcbRQQDlUamMb/S51re+P3L21r
         SW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212213; x=1795817013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSqMVmob2A+Sb2f+atcxJlJVTKhrSteALxXwOgnDQAs=;
        b=n0Y8UD24iBHA9YLKYpprjfWXDFxTDvaK8F56eyuZwKo3YfvkzSiDYx9C8jGNtQjNQz
         DU9atBP+xiLhmQPRT3DMx/40QeyN38U8x74I04s3Ffg7ijaw0vKBEUaSwgyR/tHsbV2o
         P2FPj9kEnHX9pUVIHJZN2ykMkN4dD+TzVrZrf3MA0vCF9EMC27eqkFcb3cGY3gvcSFOW
         b2SiVrhLZ5dTD3cf/vTjV8lei79JVtr8h7UaLTWJ1lgXPZ2UlAj05uYW1IIcZ6P3ER8V
         S7TW0x+zYSDpeQt1LjBRaTUUywNPNezKUSw4blpiTfJBUCHnFga0qT2BnvbW7aA6IRxD
         BUnw==
X-Forwarded-Encrypted: i=1; AL+hErG+klT7x/f/EAwYQR7ElQjBWL46wedS4n8gA5wY+2k8YNhO+cfnIR1I0YALTWg7Sqy3O7iHbOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UR9vq/4oxqGe8+3CbJMHzsSnj8zKSzxPW0+ypMJBlrb4OybNM
	BC57+Ecrc3VQotA+wzERFvOgmqTcReZVZNxKdg34MUlbdZukpN83cixp
X-Gm-Gg: AYBFou39da+b3fP0dM0AJid40wqXaQ0b6V/9shtvmLZWm4CNHbSW10gmsfd4qR4bvM4
	dQQZ0NgLTO8aQFWvYEa3GKQgnw0b4eUssfX7qDa1rHL1NqGxpyo51TmE4Ax3qj6prGlau4s7f+w
	9OeTF6lxd+tcGCa4mTDs6WdFb11dWUUh3XFVv7OXPARnUxIiccThNoKCVwo+jvCpdonpccT5ujz
	XPwxHBWMpx4vZCc9oQCQ1j5u7gnO3lEuEyPPdwB3I2YtDOf4G6ByMXh/PVryRxt8OGJCE4iizw3
	OM2tUCpMsJB/ABc7AQW68xPtWY5IKykx0LsEBkdArEe2pOPYlk0bZ0kVPsvI/6NxFruwyBfIAIk
	TewQC+lHMA7nn7rKD8qD9eryk3B/A59ql4IN0kJqeSzjP4RfblM2kWVDWTZanGIZ/AqLgQqaCa9
	k73Wk5n76yEQzJjb217i3DJc0I/sXxKY4h7lJ5ORe8VXucPSYsiWFcSInvoPHiWfF8LK2NJ1AD+
	mEd3Z+Waeh4/mb2akAgqjv6/1C7LF+PFOFZ5LQJl5pYBtQdKgpHIOmeEu+PyuHX2AqlH5vzmeKM
	BACZWtNvFvBKI4Dj9sk9p6ot5HKvw8VfXOAgjGm7rFY83fDtKOr/BVGdVMKqi5o=
X-Received: by 2002:a05:600c:a0d:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb88826c1fmr101074205e9.32.1795212212878;
        Fri, 20 Nov 2026 14:03:32 -0800 (PST)
Received: from demian.play.pl (83-175-177-170.dynamic.play.pl. [83.175.177.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9abf15sm7396031f8f.43.2026.11.20.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 14:03:31 -0800 (PST)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Fri, 20 Nov 2026 23:03:22 +0100
Message-ID: <20261120220330.1067165-1-demyansh@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add a single-pass csum_partial_copy_nocheck() for arm64 and KUnit
coverage (plus an optional throughput benchmark) in checksum_kunit.

On ARM Neoverse-V2 (3.0 GHz), this reaches 39.2-45.1 GB/s aligned
(1.8-1.9x) and 36.5-43.8 GB/s unaligned (2.0-2.2x) for >= 1368B buffers
vs generic memcpy() + csum_partial().

Changes in v3:
- Use a 64B carry-tree primitive unrolled 4x to 256B (~21 insns/64B,
  pure leaf function, zero spills on GCC 15 and Clang 21).
- Align @src to 16B for len >= 272, stashing the odd-offset bit in
  bit 62 of the carry counter.
- Add zero-length, 72/256/272B threshold, and dst[-1]/dst[len]
  sentinel checks to checksum_kunit.

Changes in v2:
- Drop the NEON path and separate csum-copy* files, folding the scalar
  implementation directly into arch/arm64/lib/csum.c (resolves the
  <asm/neon-intrinsics.h> include issue noted by Nathan Chancellor).
- Switch the scalar loop to four __uint128_t accumulators (David Laight).
- Canonicalize 0xffff (-0) to 0x0000 (+0) after csum_fold() in KUnit to
  fix x86_64 test failures on zero/all-zero inputs (Jakub Kicinski).

Link: https://lore.kernel.org/r/20261114045500.v2-1-demyansh@gmail.com

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/csum.c             | 189 +++++++++++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 453 ++++++++++++++++++++++++++++++
 4 files changed, 655 insertions(+)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.53.0

