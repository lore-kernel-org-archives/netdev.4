Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724257;
	b=xvuBO+1q7qGLEsOVnluFE0EMtD90bj/9UqdwHwX2BBXCV/g3kNRalPdQ1ixNHn2j3Sv4
	 PPSBB4YLOfN2t2DhyVqrVgvmCqDdL39/Kc214zEIBruwa0ui0pflFaxU1BUhPwbPe5zzy
	 34rZUomnQASRJSyD+sBMIJ0RKmPQhBVyJIEtgMRVe8u0VA9UbDhw7GQGz0ZZp4bCuwUFb
	 lqKVkxn2bhb4641BrSjZvV4FE8CEpeVGQHE1RIVv8N7KbxoElcsH75Vu1EwQZ4BsEvtyx
	 bnW8znNlJyvFWZAy5nI0JVTCNGW4zuHVQKL1TEmawv361DLAKAEsowqx4NRAjEQJ2Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
	b=T16D6g3ObtF90x3pG5Jn94w9sq1jDurHdEs0OMWQ0jxNSuRXpprE8OybQp+tKFCgXrbz
	 0c+b4pmVSuQPOI8jtIU0VfI38igIXgqfV/5fX3AqbUI2CgBGtawggZsBWtUdFWJSmMuKS
	 jT2vzLRHKa/NvZkgphwFKqRS+FejzjexdRIcR2D3PWkVhdfdd2GhJkXiP+TT5Ihja04Ro
	 NdM+7sXZ/tMSwoXxcz2oCZ46EiIwV+YqB93cP6x68dgsIMwbRwIX9kJGXsQw/VVhDgpp+
	 i4E+0I9NG0wOSo8IxLo6vdfksxxWXoxXxQsCipuW7rqRN4HwdaTpHhKzSmkLxvbTrBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIXrw+PG;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33DC606A327
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D33DC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dIXrw+PG
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so3637939a91.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795724256; x=1796329056; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
        b=dIXrw+PGUZ9JFJs2m6IaKkl/LIB/ng9aqcp5cpZYueYeHvzKgSF6UVxoSJfJeV3yDo
         vfHhawgOnGvwHyR7T6h8eyGAN4HfXCpBiOsD07y4j4BDjyQXiw5cf+rwbBQdX2rPqq1L
         a64HcF2K98qV8hPTQJd9nVIQg/Nmu4sAJGfqXljLu2g0SXqzT5SLrdt9PfnOLCaQIC2x
         s4+RTs4c8V8EV/X9VbeZHtN5+0WLYHpN1mR7l39YBfixENuqIPHQkFUzsMxhDyRmc3nj
         bAIrKOvMOzO9WIOWUWQXnwfM3Sl20C6UWcstdIOF+PO/fzGNcdt+/GQUUrY1r4iTrqiL
         6x4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795724256; x=1796329056;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXn/XpmalFaorWxQyW2WApryIA+d6umQwuos+tyn2ZI=;
        b=DXDiufhosopNyVyVnQHg3fBX7OqIOy0Q6paPoTe/srmf4fIa1zqbpOmQH2yv0JAKb3
         CLl5ppFNt+B4UsWRg3GsidzuUpX8iV4b0yP81xiW6x6Bf+P8ntNDTWVhvcjT8ISEgQ2o
         0/biK6nK9wmE2CW3uzi1hRnchWmc6rLWClWcOr7sYDAiyXPAgLNzxoWRzzu+SxPwjl3x
         cdrWEqSmYRqG16rFXHpw89dBfPQY1Jh1UTJFvw9MdqW+Rep9O5+cbUtUGFLxdsIWS2Iv
         1CNBwmBqMv+yzr02F7t4COgHhVuT0b4ZsIYb87dgsnvHQq4j240WioSCP3Ne7dFYEerb
         K+UA==
X-Forwarded-Encrypted: i=1; AL+hErElNi87hnllXukqha+8/VTuToG+q87wDqBBNIQOFIakGwpQ8F5SEgyj2z6fwxQvnWpyuV++cLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DNpiC82jnYSWd3HTUX4bhaNH44Iobjpga6TBUCssojV8XmirJ
	M9jzJwVlyv8NlQp2VLrBKmkEA1Nal1Ar4txrzzBkDqlt3j8eTIUGH4Kg
X-Gm-Gg: AZFdTZeVhREe7/ePRZuYXtQcMvIKYcO3nzMSJewdNY8U9R5NrN33ZRCeaZiHPPMk8SU
	0odqgRq8+rj5Z9FCCWhp+SgGrSP52Rv4p1bzt1hf7al1KIXpsbPHXNKHrWU1vefHhXtUHUOJpcv
	eRvkgj4EL8T33TqZsNSyoZhumI6T0l+5Zk56Z72zaWn5A7sw0JiUrXN/33MwxoTW/zjSTcCbGv3
	QEszceJPJsYX6AXlrfH0+hD5JbPmGpFV3oAMpikl/NnIw3ik995dD8my6AX3Y31mEmqruU2IFUt
	WEp47DqJVBLz6MSTnKtCizUT2RaTe6qSAaxcCL+serlBoKO0ALJjOt0uWzBy0FkChFpeNV9D4vo
	dShHYbm8OyQ2X1dg7yvz/UNRj4pA8tH/F+P5siXu2GuHa8aVqSBfYHgvtIdOQ9K/MTylE4cYhJy
	UPjaIPd8mOkS/yp+9whQ9mSEY34fGcr3TU9VrMNX6DJklfKIwXilRgn9aTojUQRscp96rCqVshM
	BIO184ktjT8+LXzPqEqbo3e2E5USw/VHrKn/CxaR24sOpWTj6/Ov8CoQWT4op21dkke2eotpdSa
	vk4o/sokw4Mb9M/5CGnqwRBC5jw3O6bndhEG0cvcV8+4Dvv+GQaqYBOTDqwSqQ6ID5P3c0Mx911
	Z3pynlv8DWfv/qei3uKW6bjoz2QPrVZanpwQ=
X-Received: by 2002:a17:90b:134e:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3b41c96764dmr22000708a91.49.1795724256067;
        Thu, 26 Nov 2026 12:17:36 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b50234fb25sm3468314a91.2.2026.11.26.12.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 12:17:35 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:17:35 +0000
Message-Id: <DN5F4EBDNESC.3UOJRTCXCL4HI@gmail.com>
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
In-Reply-To: <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com> <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com> <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com>
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

On Thu, Nov 26, 2026 at 07:02 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> After further profiling, I found that this collapse is
> mainly caused by Firecracker instances queuing on the
> global pack_mutex in bpf_prog_pack_alloc(). So a better
> approach is to replace the global mutex to per-pack locks.
> I will work on that instead.

Makes sense to fix it there. Every prog load benefits.
But I doubt that per-pack locks help.
bpf_prog_pack_alloc() walks pack_list from the head and takes the first
pack that has room. All loaders pick the same pack and queue on its lock.

I suspect the hold time comes from these:

  path   under pack_mutex            what it does
  -----  --------------------------  --------------------------------
  alloc  bpf_arch_pred_flush()       x86: IBPB via on_each_cpu()
  free   bpf_arch_text_invalidate()  x86: text_poke_set(), text_mutex
  free   bpf_arch_text_invalidate()  arm64: kick_all_cpus_sync()

Every free marks its pack dirty. A cBPF alloc from a dirty pack flushes.
The log of commit a9b1f19a6a67 ("bpf: Prefer packs that won't trigger
an IBPB flush on allocation") has ideas how to flush less.

bpf_arch_text_invalidate() doesn't need pack_mutex. The bits of the
chunks are still set in pack->bitmap at that point, so nobody can take
the chunks or free the pack.

What do you see in your profile?
