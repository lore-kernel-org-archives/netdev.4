Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627397;
	b=mC0ctRgiFe5KiXU4tNUGUTfCeEc6iksc2U+SxVvJ+KtKHqVJ46PkU0o05FtlU4FgKchD
	 0u4k2t0OQBiadk7W5u7YQ/sJK9PasedHZnShVMfKJaeVkN6TsR5vCANPS80Eub2oks03v
	 5OcFozrAKLi4R1KcuhAHlxVXTkGgvFHx07uDx6sNlj2Wgkdhei90BArAAobaRgNtXjl46
	 O+VBVD4Vccb7iGOGiXLWWqdB8qHQjtnFynb+CUh9pq7T+4kE1c3d76EyUysnB6kR2HVsG
	 l3jf3oU6/Sn0GuHyyvYwB/FG5C+3GOJKkAYWWl8brVy0lBXQBVEStc/PIn7iHmcpOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=L8YtNWerwT3CdUevd2KPHgTJ8Agp+9MCI6Vm8SGasWs=;
	b=SXxOHHtkE5tID3vr0huZqUaT5M1I2/nsVxonYxW8905JSE4gdZOi15p2VIbsnWS6mEfV
	 8INt8WmeeGPX2bWe8WeUizAyP/kvrqGyl5ODrhlq5iS/PDw++ggCLgiqLsGtA2YRe2hQp
	 iCSTpXpkiHqe+KOdhpG+L/qy7kGNk7m3MoSEU7ui1wUJ/XxayeCLcNPrwsYaEcdH3f4gh
	 Y9OSjG4Tmo6HH1yINPxUCTwooqqRPybgSEr6xWCD7JjwFyeWVe1TojA2pZPUCTSYuB0bF
	 FYQ3kb+cSwzuVSfUlUMp+p4hEfN5Ek61lCOsVcMnr6fAuLuXlBrsR+2FodYUvjvNQVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJRkHvyw;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB4606A338
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACB4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJRkHvyw
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-384caecc2a3so560519eec.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627396; x=1796232196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L8YtNWerwT3CdUevd2KPHgTJ8Agp+9MCI6Vm8SGasWs=;
        b=RJRkHvyw2MSNE+Q8D3lSOqo5aK756IELc/pJgxHbrClV+X0sqwN//Mslk1TDwhDWYj
         uheWcBTZcEJoo3E4MQJSiwRMZpBXC3DEU2dTIToJkawbq70BRtZj1Hg7pc6EH3Ky1JBD
         pTeL2GKVoTshl1OhwLGEJLGAyVuWzWywqyYw9bjgfbitZSLSX4ng0GK5ObdiG+P4udkW
         S7olHCfNAP5yOFX+5XN73ZpQ0LRMlTi6tNHzkzBSPP+uCquAVNfeFxYs/MEbDabR5Pnn
         EQxbETB0kuD0Rn5AeI4mp0hgBHGHyvyArZ9m5CiQtR9StIL3KRyLPmuSF0WeXYdvPiL7
         izuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627396; x=1796232196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L8YtNWerwT3CdUevd2KPHgTJ8Agp+9MCI6Vm8SGasWs=;
        b=qtFyVtfZV9qzzmC2sBqgKW2qz28E106Mu+SeXpvEczvq0CKalCSABenrABxKkTFqts
         WtJPyHLUIm/uiH23LXgmYgi/YiCBrTqa0QOG4yoAAFx7rCruIZ8xkXFFNJHURuqejs6P
         OvIMA0PUTmNP2QsFqHgoo8D0IGPjlkVi6fV/nVyr30dKLtVSaGVmmTGTKC95gDJR+0WG
         yEde64pKipGU8Q/7Pp4XogUZIKo+QkSGMZyiI+NvRznrIpzYi8KJIrGZxrDiN+bckBeO
         Qz6QiGdcUG6lV9aEJVfT+8H791Do5aJ/FzAN0EC3hDo3Uu5eAvF862l/QcP+OQiN1qPc
         OjVA==
X-Gm-Message-State: APuU4Z/JyqxEQ5HHtI6o/QirIlT/KFjXWR5JyilPYJ7MfFgfmbYPhS82
	csfXyO8M4OdkJPywJDZkXIAfk9zYyPibT2h23odtsnxWqwjU59HWH05C
X-Gm-Gg: AZFdTZdDjf/IlITSRUy0hB32aeEGwUsbrN8ey+CyRPMjke1E5t6da1tcY/R6QtaYBww
	vbIOCJ1elKcjWjJ+IfifUyPocaZNF3emik1NIa8g5HBh8nrDxbebdZ205IBlJ8MHnMvTGaIa57S
	9sLKkZPt6RF8u+ard4PN1BiYVgOUzyh26pdBUj8UrS8q4AzXahqkfri291rNK08Ux1M1MZR6Zqn
	OvOEWDYTvLMtuIFat+Xi+33r5LaGnsdhwtV+UlWHK0HoDyMjCYPdpQz6M3eEG0rZepPyWVltCeh
	FDl4Dw5UH6ui7LVpnmL/TFr1Au4C3Aig22uPcFZ0tpSReniidgXoxZYW7yvojFqq9W/vpEjeKdd
	zivm5jOvquKZMIYrY19EEXLH7VH6UFKmB7s9bw/sAxEYF4Qr1hSCwl7HePHMR70DvEtLeNoiRWP
	57TTst9ormd3oWM4hxlIpZxbAsU9RNu7bj09CA4cDA2U2keMnnYrSgFobY3fdc52fom9fKmgSGC
	tyvLrAEmNidpZkkUzFpeIc4BSy3E5xGjc46iRakoy26N8buGfNA/Zt/y3OGFpbsyXLIghwQiIQN
	SHzEjqEK7LvwrK22Q007zSk=
X-Received: by 2002:a05:7301:fd07:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-38570844f7cmr18848978eec.11.1795627396171;
        Wed, 25 Nov 2026 09:23:16 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm54992910eec.23.2026.11.25.09.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:23:15 -0800 (PST)
Date: Wed, 25 Nov 2026 09:12:56 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net-next 3/4] selftests: drv-net: add a kperf stream test
Message-ID: <awcXGLXToH7TVj/q@devvm16445.scu0.facebook.com>
References: <20261123174120.505808-4-sdf@fomichev.me>
 <179554218364.3135.5016659919665552355@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179554218364.3135.5016659919665552355@kernel.org>

On 11/24, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In tools/testing/selftests/drivers/net/perf/stream.py, the
>   "zerocopy" variant of tcp() passes ["--msg-zerocopy", "--zerocopy-rx"]…
> - [Low] The commit author address (Stanislav Fomichev
>   <sdf.kernel@gmail.com>) does not match the only Signed-off-by…
> 
> --
> 
> selftests: drv-net: add a kperf stream test
> 
> This adds stream.py, which uses kperf to measure the throughput of one TCP
> connection. It runs a copy variant and a zerocopy variant (MSG_ZEROCOPY on
> the sender, TCP_ZEROCOPY_RECEIVE on the receiver), and reports the result
> through ksft_metric().
> 
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> [Severity: Low]
> This isn't a bug, but the Author: address (sdf.kernel@gmail.com) does not
> match the Signed-off-by: address (sdf@fomichev.me). checkpatch reports this
> as FROM_SIGN_OFF_MISMATCH. The other patches in the series have the same
> mismatch.
> 
> > diff --git a/tools/testing/selftests/drivers/net/perf/stream.py b/tools/testing/selftests/drivers/net/perf/stream.py
> > new file mode 100755
> > index 0000000000000..4ed9d64dfa320
> > --- /dev/null
> > +++ b/tools/testing/selftests/drivers/net/perf/stream.py
> > @@ -0,0 +1,40 @@
> 
> [ ... ]
> 
> > +@ksft_variants([
> > +    KsftNamedVariant("copy", []),
> > +    KsftNamedVariant("zerocopy", ["--msg-zerocopy", "--zerocopy-rx"]),
> 
> [Severity: Medium]
> Does the zerocopy variant exercise TCP_ZEROCOPY_RECEIVE page mapping on a
> default NIC configuration?

NIPA HW runners enable the pre-requisites IIRC. If not, I'll add it there.
