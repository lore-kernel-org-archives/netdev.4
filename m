Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555039;
	b=ezQ4BLm1gMkNiqW2z8G8rjLbaihwCQhb+1EoBHs4mhUj8XAqJ7K3Mzc4Mu4kUuXjMlLS
	 bgxtYQpGAqeZ7nS9l1gnWhL+tLRzRQWIgBdjRNu4W96edqTflTXRayOqLSDTQylv20q1N
	 obQvZYcQ08pkyG9sZI7ZmP8OSxrqCG4JyJXb1UsVDgMWb9WM4+GVppRC9LViSj6Cd6YsQ
	 JdxIv08A7LKQHiTg+cVJsLIsw3CBQ3XnvzNv93gIqZWrmdQNIEU7Fa1Kn2PMMQiT9BQ1R
	 g26wG6fHwf35nRp6BmuyQkfiL/DsXaQ4GUUuR/acfRo1xL+qKBagyBFn5bSGglD20MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
	b=etOrg9wrHj8iZ0uc5YaxXD5lo5SG5ft4itJMN6yIiiwEx36MbJgWy1lG4xiuzi/cBkWK
	 U1hZsj06g20nJmyTPheHOuxGVF1m5x+0PDcnbKCvLzSd+XYl14Ux1IBKM6Gpp5t1AjBe5
	 rO+kXPpEcehIC34sJvxn3/WucDPL7xmBYdT3p6wab/qvt+X+4mGEWxyM2hAN1EulB6efr
	 1jD1eCtRumgPtYfXmcfazqJMiCXjrkeR3A3GV8s9n5XKX1p7mqQl646+WxQvISxIUB5Ic
	 knedxuatyFdA/bG2zBaah3grLg/wkcZTVx29wGiHFFHWBRb5Jgi/yy1eK8aB2NjgH4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuhBzzSQ;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9023606A6B6
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9023606A6B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DuhBzzSQ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4af52002471so5881725e9.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555026; x=1796159826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
        b=DuhBzzSQIOmob5iiMXjAspZZK4dRaT2eyOggvVWtx6Q2OP9Sp9y1lBkgw3uul1qzE8
         72OVbG5PhPpYZvJFMgS+BwcIMli2L1YWDlhKq7lWJSxudTX+FsbdrAkU3tL/a7w8iYF7
         EfSNMKPJewpaHr+dqkGZ4QIUryrR37cEwbpbXVe7V2mo0HmNGPRdYJWUlCglGvpGW0AI
         w13htGx8cAnyPv7+ZYp1LEBujYn3k+wFzQEaR4NkKYsdcpc91DvcN4CBOpl10aWiN/cn
         pCE+bsI2P6xoVECfHM2Gx9sebBeOFe58Qi16fFvFYFZtKKlcbeZDzBJ2fNUa17IiM//k
         +YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555026; x=1796159826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jOH1sHCSl4JZmkGS3KDfp8Hz65+JfTUi1CKpKg9AkuE=;
        b=bYzWpRZkNV1VRyINZhC1zVappdzzu2NyqkFLrKkP0PUESN6FVjSpReLwE7qHGmpSPI
         Vq1dckDjYg5c1/QgxVaAyYdTAAWyHlBh6e/SSG+6VVizzvP2TMFYiFfrEUbB/pWjJW2V
         Is7UWo0g3EAyZWXYIBw3RR+79XkcPnuW1XTwJEsLW2mz9CKuj0KKAhz0ZT9qIWtVCHUA
         AosIBEk3DyrEIZMrmX9UDhBUIL7JIevebZHfn1T6HfwVXcTVd96IN6srt3tS4RdhcL3Z
         nu0hWudzqr1HpWyDSKzaip4qwaOVhe7zrOmbCzBDJrC0jeU30dNMRbwjZizhbuEwFhNh
         kYGA==
X-Forwarded-Encrypted: i=1; AL+hErFIUc9rM+Ky7oDmKhncV23109U8sykfpGkxkWa/lypWONtHQYV0YPEYdB514Wi6mgfPQHBGHts=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z6pnr/JNxb8oKCx4H9gwGW63DVzAllF5n4q0U19PvdByOuA9X
	D6txHCX0mPmCYCqQv0Oofwj/Q4Fq/73RnWq6i57d3ERVrXx52LyrPgFw
X-Gm-Gg: AZFdTZfm1ilDVapDrQmqiMqArXm4JeVvXHSmnyVl/iNOPdy34YnEtTjG1P5ZPQ2MSWM
	3FnnCCWhwWGbT3pAPRhVG21nDQih1A7u9qF1fzhk7Hub0U3uBeMxzhPVaJRImxlnUqU+sr7EwPl
	HUf/drM9NI46kY88K2spVL3PXMQ6PxuRgk/199efEzl7v4iKstQ20WCyRPVy21NjE6O8dPnq/pd
	b/p0ahbqUINEgzNlvogV02IuYtKl8wmUJpigoI/y3/hH49eE8YjQUJYVyzPxZbFx9q2c+/smnr9
	1GrQTNk4E8kalQ8dHN6ycYy7IK1N2kO4IMDMvW2DOPof5RjcYzcbUp0giUQ84bOS6892S0N95nr
	E14OQpxseFvRxRmZJDB7aDgGzPVWOb0yg36WhlHpyx3aJ7Z+zyxHWK4cmPNqMHix4/DojY7Zels
	FdrfpM6BC4i8zZBO4jSz+5ZATqmSYoqsvUbwRa4vTojCcI40tdTm/GJfngrY9D/+37cRNH1rMn0
	kTB5pydqxd2aZCitYeqIzkJLsgUP9FDLoR2Nb9agTNEHb7IgnAqjvjJsr0Noy+U4k6QXsTCiNgy
	xk0jeDO4zyo/e/a7Sd7aGM0Jsc56J2PssIzn8JMouwOKeVqdL0waAodrpyCO+TQrGE+2
X-Received: by 2002:a05:6000:2505:b0:492:3672:eea5 with SMTP id ffacd0b85a97d-4ababda5370mr33797353f8f.2.1795555026024;
        Tue, 24 Nov 2026 13:17:06 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:05 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v6 0/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:16:43 +0100
Message-ID: <20261124211645.5751-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once the propagation patch makes failures honest.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v6:
  - Squash the two propagation patches into one  and add
    Tianyi's tags.
v5: https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1 (thanks!).
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (2):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate check failures to exit status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

