Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032332;
	b=SVerIvWAP4gLUkKMUwXklR3v9nOwDMIIhFjiqEt59SXHeVcYkUROGW3Y3uyKEc99dnNy
	 MHHEG9DEKP5vsMK8xoGCh2Y2+MSIbm3cJJ9y4ko4JwxDh/IvZdv1T0GrMn4QRi6QGRcOZ
	 86KwLUN3POjS1d3uMxsxjCv35HjpC2M3YfX6WjxlGQCXKfjP4yWIElw5arzHv7cEYI+cU
	 1cgGXrDRxv+HJhumDtddigUZ8s4YXnk5QtFFo7xJZF7Pwe3dIthu5cs4m70QvinuPww9/
	 /w1AlGOXbC/0eXV1p6M7vQAekehaA2yxhR34BAPWTOmFDvz9Wf0UkZOwQs1DRbBDAow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
	b=26LKiK00Zx9Rgv2HjjdP8NO1KYGOdUFOgdp3sTe/z4KPvqugG+Ok7T1+Bo9R9w3HyZ8+
	 l8COlaR0IRzy9CSGSnzzBGOcX5xFnEbwV0eO0s1iPj4M/y+VQ0TRiFMjis/n+cqo4ngHH
	 INf+Dg2szSlxn1HIdt0Yl+g2Lr6ry69CWbkkuSNY73juHwWVp5J8CIt3PsEnrlpqnbA19
	 b/hfMmQCmwvS/eAtMZTsudtyQ52NwtMfXnwIzS3B8LGW9DcoiOFRUyZO9N5qWwUAuX8Ml
	 qkFCAepT60vTZ1Nn114/qIGINfeiIpll4nRFVDBsKnTH7zowRJJkxscOI5XvA/0KIlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FY6HgOSO;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1D860A2636
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1D860A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FY6HgOSO
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40312e2so3939138eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032331; x=1795637131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
        b=FY6HgOSOJk/B1JD5ErvW/oO/+/P2xQrqnVF6SES+Upa4hNTakVRhVg0gowqNRZNFh/
         3+fVjOOYnFMnjAUchXcqaY31if+qJT9qMCyhlKMnBQLgtZsgESZlBdnu49iDYrFtZ7Bo
         hZ0rVXMU0FzNs8zLXO505C2iIV+HrAV3QrEFI2CyCCG7P51W9D7SjpeR/91BBSLUZq6q
         B6HwhU2DHNyYG4zuw4UEpIvDo2BPIZqYV1aVnGOYMAbDHdEGSXKkuqniA8hwAFIkg0Lv
         53dFkXS4oNGJgjtot0JaBj6eesAp1vD+Gt6jXtuM5EnNY3Aq3ThZYtGKWTQAPn69Pn1j
         0M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032331; x=1795637131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhY1kQV+0BeRiYIEaScadjDC4jmhduQLLve0FXrFB4g=;
        b=qjUY8oRsFf3zex7ID5F+rkS+oOrdqJ/P25bj/NDlhEQbkhG0H0Su8Qo+hxrNeRK2aW
         8w0w8LlHAw3xGW6922XYHKVu9pu2kc/mG+emdu5GzEebLGWQv0i8Glj3Pz4DbVbuzw3Y
         SH+5JhRZ69ww8Ehtyjyv0XAMiW+O6vy4MZbu0w7y+XBhbJEkNyZJgaS6xPU87ous6QKi
         d+SARQS8rgqr7xrI3tnrWzCMpdEOQegAg8M1Lhx92zSekizLXuuLAkIeiXK7xWGBcFlf
         zuc42mWCdrW/G94m7AKjtQnkDcfYNlMfg0ZfKEq+Xz0hC6E5mQvjCku6gnTuHJaFbv67
         D7qw==
X-Forwarded-Encrypted: i=1; AL+hErEM/FuBx5CGHAtHSMhg+Dg6VNApwjzq0s4G7fKpx8ZkMK9nO/iGRskENIlPLKiLwv4AwrXXA4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8DW/9m8drsFtjpU11XCD9+2ChyZgV84FryHliMwRHnNFMh1gE
	iMQVWvWLLV6z9AQizYTSucOA2fPRIPYMP38RWbJ/avn/GOsP+lF1cc5k
X-Gm-Gg: AZFdTZfw2dgqG8XITjmAq2UgL2vB+xDH0iet3Hzz97MpYX5efeFVh/+mz9aWbYicuq6
	jQWzyyW2fTtndhtAiaRKTRs3csDSoLRiPo85Agte2Pr5PtmIiwWyRZ9NUOJNtgZIXlvHBCt75bL
	G4tMwhy3zQPswFjkcpRyz50JAhoOrG2pF/15M6UqTXKONt5g9X+B11NiH97is2dB1Y8A3KGmsSC
	k3dtv1rvnwgqkxLXDFUze5PjWq6nghQiaA83ZJuZQTVr6TwTQjS+LPdm6tSg5qiGyxOY5xMos14
	d3J6hHFaaREQPACijcVS1ipWckfGCW3QWfYN/MAqSkUJ78ZRmQrg0reWmHWYeFnxr9bPrgIs45M
	MAUpcGw4rMafbhI2szsqkx8NrNUCwNJB6VkxLAAkJu+dsDS3nkXwfaWWx1LMboDN0D4WiM5hf1D
	xWfvXYJUgQMGUEVww2RKf3TQYx5hAAwrLwq6u88eufYyCdacVM4o5VQ9jt1t8/ML6xJZgUH13/l
	VdlIRxinj3vG5Yo18bB9DGMU1YAV6InPUKPng+fVqDSmjiNQrbPBUjvxXPg3TpW5UfQVg1jLSZv
	g3G966JdgXKxfvwv3Gx98XAXcSmQ2AWRnAfv1IZKJJfzxvMBkF6ieGOozp+kkGwxkBQEJnpbSJ0
	tCLSOMe1N9bMVnI7BpEWgoa10zKc0
X-Received: by 2002:a05:7301:77c3:b0:376:2ca2:d80e with SMTP id 5a478bee46e88-38281214024mr2770749eec.30.1795032330636;
        Wed, 18 Nov 2026 12:05:30 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm11032107eec.24.2026.11.18.12.05.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:30 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andi.shyti@kernel.org,
	andrew+netdev@lunn.ch,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-doc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	richardcochran@gmail.com,
	skhan@linuxfoundation.org,
	vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next v3 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Wed, 18 Nov 2026 12:05:27 -0800
Message-ID: <20261118-timecard-common-301f823ddd-r1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179502617544.3136.16911407487347494512@kernel.org>
References: <20261116-wiwi-v3-87afa10a8-1-ahmadexp@gmail.com> <179502617544.3136.16911407487347494512@kernel.org>
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

Thanks. I have clarified the comment in the v4 draft: the subword offsets
describe the default access mode, not the forced-word mode. The latter
requires unused upper bits in CR, RFD and DTR to accept zero on writes.
It still performs one transaction, without read-modify-write, for FIFO
accesses.

Patch 3 remains the first user of this flag. Other platforms keep their
existing access mode. The revised objects and accessor tests pass; this
revision has not been tested on the physical card.
