Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826017;
	b=j27URDZ9K1QXFcrwMhLtwV6uHXuq7LuoMm7qzV05FZ1xWbtS1PND1aeplCMdtjNPpL57
	 IeTds7J8SQbNWhdVR3UeWRGWASQWqBRin+KmBhzCBvk0ycIJw9JCGRguyTS7zkdguAJpd
	 fv1vyLXhniDwZj/+FCXR/giPEkVIRq2BJY+fkQD3qlvYXBPK5j34RayNRJ9DZxQ9D4nKE
	 5yCr4cmuNL5idm8hPLOfKhn0p4TDFPBvWzhyS+ZtyrLFCc0JSQ+RGtDNUmuvYT26QGrgy
	 XAA/Kx8vI+4vwRubS8PEquX1b8DqYoZDr4iS6wdlAFxiO59OpcdM96nDsK+l7InvD3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
	b=5h6VHWWmT0YdV0aQQpf4UVuDewk+BgQ4UVJETqjgw3z2dzJG+4MjqSOGbJDirvfclkW1
	 Mes60U4d5TexWHY1afD5rnOUgHWO37ADd3E+utYnnqsjRZzwDaGSQZWmIhIa6r8xfQtOR
	 +/LL2uFLoKkUG9g+63BtaAgrG8KZizwLZDB2SHF2DhuyA3BSWc4LFLcuVJSfkSfkBjlaI
	 pxHazJcqZiYNN2MORNV3szJvkuEibePOPMqP1/e8d4NqV6joWarwUEmRTaaX68UMTr5Yk
	 ZAFlvUTGwe/dMBw/2wq/TtwWM7TkvyZD3Ut07UKplD2XhWX+M6X4rop6YsbAgyVYN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtEfMRUf;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1412C606A31E
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1412C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtEfMRUf
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso4189694a91.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 16:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795826016; x=1796430816; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
        b=VtEfMRUfZ3zyteX9vboA7JB9ZusTTGvzZOPMC/5Zmc5unjfrfu1V+L9VEVEdpbLwwm
         +pH3uXa35kaCWPzE4JrKggHljzEp5AKNSP0EWh2laOQZ91sB1pFNt1rAH+CwrZpzhuqU
         Kz4Yv+dgt/w/cahpmYsq9vgnZgcCuqTU/we5LM1IYaT2PqzE0NCasYG0QurDtaguHiiQ
         HNsHiqpCOkedaEj4y3PfBloCVIuAhjA/qv/S7hHqOrH6KRZG7IC/OIWrKVXyIGeyzv53
         ZWM8Du6OSmMvh3h18mCQ2AM5367yKk5sLJv4e8+DYrWAnMLRvrmH44wJXi8+qQT/8J92
         neyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826016; x=1796430816;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
        b=qaAM9x9ycpNXg4wdhqwesIVAzaLqR2hQF4rlRpor/cyaP1q/c/tLsnGJYemiVX03Uc
         4WQ2VUmV2QMOxxaxKHrqnjxffzzfi2uxf5sayfitnPwRR2A04VZKYLbuQCg058WXowl+
         AZbnB8IM2YYPkBZeFhPF4xLGeU3raSS037y4K9Axa3QoH0b9CYAr4qk12HCr23m1upJ2
         7dF2sPQ7rCopchNTCOhqLTbtcg/O4ljNcoQx7SAiP5/La/S96p8i6Ch6P8xPlM4+otH8
         CPSg2DnUOzMcgNnxnnrSDPWqNCzsEeynAmKW8Zz2na9Lrit7+0fH03g5J9Q4+gXVmORf
         S4Uw==
X-Forwarded-Encrypted: i=1; AL+hErEbgzWCmGl2evxt68Sh1Ps2KihHmhDtDsDCJDegapANhlmlYzDklmy0GmpZqVVxm4M1j71oQko=@vger.kernel.org
X-Gm-Message-State: APuU4Z/y3O2tkmXjrhkUo8igILjeau0CAeMilUVgv835oSIbc3bvfL8E
	eN+fWwNmFW0+GVT+oFp+5dpQbyV7bqAQGt2LG4PmAkcgAjllFQ83Zq/G
X-Gm-Gg: AZFdTZd1tLepDxEaW+4DnMnfuIRjjZPhXPGtdi9Bt/s0gkBkxxP5iTOCzO471JuA0Zj
	d4x6AIIPYxl7A1g8km8pQhVuen0XSTaoTnwS5fnjEGLge8+O5XQk2yLcBmu4QvPVivIJWDaeD6c
	nFn7fLX7HrWIEgdRFtau4YEh/5d3XD/zdnEIzqTVkTmPls5ZWkJhlQ1Zv3Amp54i5NALMRnRFrm
	my0WZjf1lJC2NhscbVIU/dijQZs6JM6Tmwol5qnnXfBHXQK+QPCKBK0o7QjXOxtxAnedo6BqLgK
	nvmX7d/tlyFGy8EvjFG8HsV1bn6En6cAZcq69G3GUKOUrRHTKqLMfQF97EzKNC4nHVrbq90+Tys
	aG1zEAQP16WU1/B03W5wRZMb01mJaua5QkPiA7yAO7gz333U3fEssxkSTjHa6gf1I6z0iL84SuB
	qjX05yKFBOua0OtxAh6tYsmp5JSV4owCFZmPgJByxf+9O3Pa6YzdXA7tQM2ChLVpm3wftpIxqsj
	kmvew9cxAwAh83+wuAo71IydicPykf6O17VfbKJ/Dd/FITJlR1MrTcQkHkFJMBxN7eQoSn7Hkxl
	f+VMs+UlSP4GUYS4FBKeewH/PVZVmQdKNmcqeYY7eSU/twp8oC3yUJ/dFvUlUDpd2RmKYuLBqBQ
	+AkTarYesGlToDL3eA+3SgxqEfna/HqI68A==
X-Received: by 2002:a17:90b:4b85:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b41c7c2384mr26668854a91.8.1795826016052;
        Fri, 27 Nov 2026 16:33:36 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm30793634a91.9.2026.11.27.16.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:33:35 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 00:33:35 +0000
Message-Id: <DN6F6Y9I0QD7.1B49UETL2EKDJ@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
In-Reply-To: <5b1c03a4-f910-4f97-af3e-1b8c328dd1ba@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com> <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com> <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com> <DN5F4EBDNESC.3UOJRTCXCL4HI@gmail.com> <5b1c03a4-f910-4f97-af3e-1b8c328dd1ba@huaweicloud.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 07:15 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> The free path is dominated by bpf_arch_text_invalidate(), which sends IPIs
> to all CPUs and waits for completion. The wait happens after put_cpu(), so
> the task is preemptible. If the task is preempted, other lock waiters remain
> blocked until it is scheduled back and releases the lock. This can extend
> the lock hold time to seconds.

> After moving bpf_arch_text_invalidate() out of pack_mutex, the p99 VM
> startup latency drops from 2.79 s to 170 ms under the same workload.

Awesome!

btw every free still sends these IPIs.
We can probably remove them.

aarch64_insn_set() can do caches_clean_inval_pou() only
like aarch64_insn_patch_text_nosync().
bpf_arch_text_invalidate() is its only caller and nothing runs in
the freed chunks.

It can be a separate patch, of course.
