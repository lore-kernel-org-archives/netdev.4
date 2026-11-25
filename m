Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795586748;
	b=OmsZGarrt2Fh70r9KyqwAqZ7KgbINlyM7zKoNwV1xGy0GhYNN0COucYJEDgyV46k1QET
	 EytPiuzaP9eIXFDMz5uTGTfuSFrPF7zLKxo77dPHbzKhBDMItkVP7kb+N/DzxlZijo56o
	 CfU7LtPCmm49AvLcAFDhdaaXgBI1Vy0subkrk429LQnkvPf/sf5kP7mq0lbfYHzdRDwhi
	 57Uw1FYP6tP50Btwc+uAh8jbDE56+S5ba1KSjMs3ByTyXZnnkUiVZpzRIkGAFLKwfJrcV
	 GLmDYtP1L08tpI6trI6K3TjIL3YNcc998bGGFImPkN3AEWRg1fJdEpLMm3kTd54QarQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795586748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uvWUvSzQGWdU0amQGudBjE2MMEoWKQd9zyN2yG8Iybk=;
	b=1csHrU37hXVRh/aYvoNacmmYZKx1fdwsboTkxqpsH9mzwrQWUXzKbwDnVFfdGHz6+VM+
	 /I3WJFKNDoO+6Hf/RnyOMkOpOUlFh0w6K0rySGvyuYAbGw6yrWfw/WB7nzcMNjtpHKwFZ
	 MCG4feKf54iluFejEOAt6CQ2z5JCFO9H/haUuannkK9I39Nzbx7mv82sztuE14vSZ1/Th
	 0rFxkfo0tD8bxF+4WQWNWJwt27jcKk7/d7xtGVm5tZV3KQ7X17OPbmFt1s9FzCnmUrgpA
	 nf3GdMAF4953s6d6SD6s+rnPNrgqx9iwf/d4nFmpI9xOHcFWhHya872XID8QJ9kiMIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQ9RGk4T;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134D606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2134D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sQ9RGk4T
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so7913376eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795586747; x=1796191547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvWUvSzQGWdU0amQGudBjE2MMEoWKQd9zyN2yG8Iybk=;
        b=sQ9RGk4Tox3CJBgaHd1rERGLKFnMlSEy04aCuumhalHDASrM93RkBheM3kfuO487fS
         RTFW+tp4XwuGTm2cLzQvr1Ge2pYadRPBHZpVt6UPz+xpa8HKhFn7ak/N1YJbo+bu1AIC
         yagdq45DU5MqDJNP3sQBCmYdFWU916d5hc6eXEbd9H2F/g/ojM1sE/XVAvAbzg+zunqV
         O5/aGKchAF1/92KN6ghTvUf/im50ffIbXI0nxFTsGjz3YvZnqkVdbJsZ6gFrnSDFfq2t
         OBnd8/q4v2YL+eEGxvYSPFROxgOxfWusmUtxdTOKMuIuLfZfx/E3dZLIAdibltkRBJj+
         wyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795586747; x=1796191547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvWUvSzQGWdU0amQGudBjE2MMEoWKQd9zyN2yG8Iybk=;
        b=ZPI2fQBr6OWwM/zaJjnFT+fFfUxTUTzgZeWEtMtWJ86uEMA6BwS5MypLjJRbppwoig
         5Z+85dleNZV8AQXuncNf1J9FQUzbdkq+Ry44w3bPP/0GxhgQ5SWXhS/2AcNTzh5AWxUv
         ytBRGcJbugS/sVXYAUIqNkCMOf8jzVpV76f6uFW8ob0ncDL+6+xLa0AQEltwJcQtITZ8
         kQqqCqb3k35X0jxwwmL/DBpKHyQH2alrbvUmd45w7XKJx3PHhBUby53gRxBcULXes7Gk
         4cNBa1S7/pr/ZxKVnUb7h2ohii7obed+Wa7awBVVZtGJnLyYxw20MUpItXai0QwDU4r0
         9HKg==
X-Forwarded-Encrypted: i=1; AL+hErEmJJ9eva9uaWNaD6KSVTc6HQz3XQNWvpcw0Y8b74umtbAoynoYQkp7bVoM6iIXmwIoB7g+goY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OUo/0DkVGHY4cdxdq+luK6YZyTJYyNq0QUFhp+9vuZAXncW8H
	WuWfxv6DQK99B8jZ/yuTojLwds6vbWclP9DUzoKfBsbduHtFIGHEqAjN
X-Gm-Gg: AZFdTZdjpD+xkNH7JdGF5HAt9qJg8JFY+a8XC6k+4zuRagy/xgC49dFpHvxNY1ougF0
	M0ucdP6DiSvxL6mb3s6MtLtgYm9iLQAcbOB3Wy+v/ml8f9/fh0Is5RzdRA031LhpLFxOkEak7Wz
	RQVA1Vaca49y0ygZ6C+xE9NjL0n2c7Vjn2oPhQsB4Qk1QdmNbRmijxPicoJq8JrhcGmHjFlbayY
	FUOknA5laCpQKfwDs3tN41eoMquhzcQpTQ/KNvk8H6358W1oEgLrnJD9FHCEEDHhmKtHKb1mAzE
	sls6lLUEc3Abwn5/vC9A/dAqRKj8kiF/Q9ZT+LHlCi4BUaMtZTB66IPQAHOiI++rndwcotAO50d
	/Z8oD1YZNjl8RxOzyBU1eRfG2UHSrUmrv2Bu+/jcdAWNrNA00/gXnNxTLUb1O7IwBxT0wkbUU1Z
	w/bpHjw3N/8YSDYeABRsVuRd8uQeB7jmBXkdlY6WZFjKO5kUNT9hIPO2x+Gu+HOsWssc0meZoTU
	HKUX3JVK2ikUVYzN/TeJDLFqDwfibkn+WJHsv/zecqNWfxjr02qqH9tZPJk61TX5+D9XbMxZGEg
	nLYI+gjNfh8dVdyPtarsFant5J53zO+n14Eu4OSnQWPfCiajPVcLxYlpjLnGkdnkiEfvMDfSH9Z
	i
X-Received: by 2002:a05:693c:8948:20b0:386:b08e:4b7b with SMTP id 5a478bee46e88-386b08e4e93mr8414503eec.29.1795586747002;
        Tue, 24 Nov 2026 22:05:47 -0800 (PST)
Received: from O1PCCC03033100.cn.corp.seagroup.com ([143.92.127.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm57080152eec.26.2026.11.24.22.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:05:46 -0800 (PST)
From: "chenglong.ma" <longpareto@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	2312891301@qq.com,
	blum@kernel.org,
	co+6dcbccedc9ec6452@bugs.sh,
	eperezma@redhat.com,
	fangxy@xiaopeng.com,
	jasowangio@gmail.com,
	kmehltretter@gmail.com,
	linfeng.sun.dev@gmail.com,
	lirongqing@baidu.com,
	oss.patchbox@gmail.com,
	p@1g4.org,
	phx0fer@gmail.com,
	physicalmtea@gmail.com,
	sergiiushakov@google.com,
	shubham@octane.security,
	stable@vger.kernel.org,
	stjepan.poljak@gmail.com,
	syzbot+13df72e0dc4be5c62215@syzkaller.appspotmail.com,
	tavhadia@gmail.com,
	tjdqudcks0424@naver.com,
	tz2294@columbia.edu,
	xieyongji@bytedance.com,
	xmei5@asu.edu,
	yuz08559@gmail.com,
	zenghui.yu@linux.dev,
	zhaimingbing@cmss.chinamobile.com,
	zhangjiao2@cmss.chinamobile.com
Subject: Re: [GIT PULL] vhost,virtio,vdpa: bugfixes
Date: Wed, 25 Nov 2026 14:05:32 +0800
Message-ID: <20261125060533.1296-1-longpareto@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
In-Reply-To: <awWOpS3HR_2FTN3I@gremlin>
References: <20261104081535-mutt-send-email-mst@kernel.org> <awWOpS3HR_2FTN3I@gremlin>
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

On Tue, Nov 24, 2026 at 01:51:29PM +0000, Lorenzo Stoakes (ARM) wrote:
> It looks like it doesn't need VM_IO anyway, the other changes in the patch
> make it redundant AFAICT, so you should send something like the below with
> a Fixes pointing at bb2e6f166547:

Sorry about that: it went to security@kernel.org (hence no lore thread),
I did not test it on 7.4-rc, and you're right that VM_IO is redundant,
since vduse_domain_set_map() is the only way vhost-vdpa entries reach
the domain iotlb and it already rejects anything backed by the domain
file.

I'll send the one-liner with Fixes: bb2e6f166547 and your Reported-by
and Suggested-by once I have actually run it on current mainline.

Thanks for catching this.
