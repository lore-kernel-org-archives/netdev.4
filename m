Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557003;
	b=wi0sY5s0WLCizfXOdBdqIasDdxse4WHUYjatb29VGpWjBO5vyNOZRLsKLApfmihD2fjD
	 Mup+b3g/kVgEhJTEfYFSMKQnSppgAQSceKRiL+z0PGe0WlqNZXNq0CMg5eG29AsBn2+YS
	 Mpgi1jTmeUBTyrojOHVPx3qGKJ4v0Ecvb6KEPlCnyEQaIVAVy9HOKk9GWQzdBxKcXX7/l
	 kq5BVa7NVFHNBnlzUqShhlF+ap7FfUgZUGjw1mhPxcqHMLRIhiKJCEB7T+YZvbEQKblP+
	 rz6Jf5aSOBMFoj94YO543boSuT42H2pj3ukjrjDx4lK5wOHC211vf3k6mISRH1TUFfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
	b=IVLRghOyfrPiir9rEuxlj7r6OJoXMfsj2z8ZbThLgIe60CZ8lEGAEx6yKkzpbq6gWGrk
	 iWrecsBe1qy+qMZYT+jukwwgpmarBY/eHpFFWlJCwdSPmQ7YAgcOn5Pi2e8HGkkVGAOQR
	 IOqr0UNEJkW26spdxSdfHv9CTZhLIMWhKPFCEjclCyRIU9FBuycaM8+klf+qLdmqeiGTu
	 4ioE84NXa2aiMf1kHGmevrueDiE1TsaljvqV1Bd2miA8AGL6wGkqGtlVJReFQqUeBgw/N
	 FYNx7UJkSU5V+O80H+mj4Uv6D+FN1GiWc3h1YyeViB8JOSM6ysKHCbto1HxTFSaDIbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fp1Mhntr;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF4E606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF4E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fp1Mhntr
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so473743f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557002; x=1796161802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
        b=fp1MhntrLogHIUip4FbRNJKgWHj0LrTc8fZZovGtzElIDsO9y0NOAIL6mqq35lixzC
         AwmfPCM/wLJd1kp/v46CitnfBIH12MWpgZr8aJZ9uK+eZz24zYRUlwADwEaNNft/PSYD
         9Y2ieWJ9h6JfkronDg3awtzO/DkFNEG/2dQYe0sR5it+ERZ6uT+LJMmO5GbLUh93nefu
         VUlqC7eFCZ98QJQFZoO90yVKuuRukiBGyhi8yzXNZ4YJ931B5azsQqNPH7C2UEj6hM+h
         lazIEN1nFiHKmHlrjcWublPnYkeXVLNeH9Ts3DJMUTc40lD0CuzsuBG/fbJno8piySZQ
         pfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557002; x=1796161802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
        b=yYtKPY7MaTcIDIwhlJoAaxZTXvK53dVqt6P7sVjOKsW8kMlmXS7dGT2GWEbddUS+m3
         CxNvUd4hZKJattST1VIqHaFlATEB98Od+IwWYlVSvVBrGqRAfy6p1Lm+WB/UaDjUeJay
         P7TC6Bxu7cdJTaUiBZkuE2WSpp8cudpMd30lupp8IEX6I0JPsub69V7sn42L5blEbgaG
         wC4NMVdijdGbtjW+gblBKmnfAMkLtoQ0+rzInIZQKzXDuFdjuvdPt6sX3RGKxvccKbGT
         EVOrdLAhp1hlwPi9NGDy8WqUQcUool1TM0BBFiSQBylCi/4eUI7jUB+cf6tJCeCxEzlW
         U/Ug==
X-Gm-Message-State: APuU4Z+sS3KxzA/maTCKSwY4FNe3yo//kePqMZdJD8hpmb3HerMrY175
	6Jr+VCbUa2b3WQ1G1iqSSRs340WBrRXTFwekd7G+Ml3D/ttxKg7Pr29m
X-Gm-Gg: AZFdTZfMdtnZWThi5n+4ghpM7pHC0M8bvqj2h4SK0M9HAZpjH3+3OPLJcDWHgSiP3up
	OLQGDkca7YO42Ow6H9UIOKiNjFJuByKlToUqY4iGYUHbrbWFEDk9OiKwJMd6eG6f5EP7UHqWGcZ
	gH4rey3Ghh3GgkItWzybWWK0EUPp0YNjnxZtz9LfcZ1LSW6CQznS0HioIws4wFVWCC4LpxoO/t3
	MH2baiY7My2Vgwz3w1LWZHI3nhafaLfIP0Jlnrfvx0gAjn5XFeDxLCki6vRwotYjiD1zxYkeLs9
	PV1iFYaUYJrFq4Pd9anooN5awFkItcEiMLiU6B6l2f0kwVNWd0aEzAN/knL1otw5sDznSGk9Ic2
	Izd3ZajppQ9ibEV6+VEPeKd+kA9OCaRATtWt2V1/gzhhwnbe/MQAT7uIfWwTrKOBwDRp4C73FcK
	7vlTfYThxcVtrz0hNXC4/pK+S51lZfTL++b+4kZ5mI2+1TRGCzGmkbnMHWQZLEIKwXyHlHODd7S
	7evDSEAfkOsqCCH2Njso77v8C+DB6rc8Txfw6/nd8K6qs157z4taoIC1+ib8mSfwkcljXSLiMCZ
	wPSOKEYei/dZfWosbOgU6xG1Y/OQQ2qncEWTOXm1lX2s4D8LDPcsH49aNn+fEOHiYirwjnD24c2
	bwm9XoW5o6NhBFcA=
X-Received: by 2002:a05:6000:2310:b0:491:2367:1dca with SMTP id ffacd0b85a97d-4b3fd477a9amr13343648f8f.3.1795557001928;
        Tue, 24 Nov 2026 13:50:01 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29188507f8f.0.2026.11.24.13.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:01 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: hangbin.liu@linux.dev
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Tue, 24 Nov 2026 22:49:47 +0100
Message-ID: <20261124214947.13846-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123054754.GI10218@Liu-laptop>
References: <20261123054754.GI10218@Liu-laptop>
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

On Mon, 23 Nov 2026 13:47:54 +0800 Hangbin Liu wrote:
> An "e" here?

Thanks for catching it. Fixed in v2.
https://lore.kernel.org/all/20261124214736.13398-1-emmaonana18@gmail.com/

Omokefe

