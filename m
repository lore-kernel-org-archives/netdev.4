Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627396;
	b=1uxIFq5YEdGA8PTopIe07kkWSadJLoBVm/KtlQ51mbckMyBML9fL9tYZd9otoji0erFc
	 KboSS7/vvCeTPptoaCIRXV+ucG/jpGJd3RaGlbQeE7nP5AuO2F1ZeViZec/vtddq2RHfB
	 Vx+9DxkQ3IK7FYWj0tRHiwwIO+cDpaaF4FLyvA3ysQ7fNmL8deOIn71tgKPPVhuZd20d9
	 RlcLd1UbtY6arkzM68ZBy6clfXGky8tFjcyTekegwWAWcgBQ75ruF/oNISQYKdwpXW3y0
	 ZM3mkjh7Q5mP6VRsND5cHilAFo1guDRY7x7F1aDtXXVf//nMVdSH5TP9sqpjFbrxjOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=M3cLFOviybsaEA5eYi5Q+NMk+ioo8WIGpCekkymZxlU=;
	b=e/wm3ENMqzPbOl71UZ7uqlsK5ydSmZFVrd87TKd8OlwxuMDkFOZ/EOIIyRpAuHUq699i
	 VLX6S9Lr3yh3bTsuqdqPEyKhrWDDdgdiNjWSv/FFf2/jMcqutk1KSyFd70404mVXZlRlx
	 HPCCzfYjtMqSrs1G93ihrwwhaiK5pZRh13NZuln8Fe701E54aX8+LLIVFP9o4wdE5/bir
	 6dQIAGp7fG4AkUNekJM4rCVo0brtZbS4GE6zgs0lMNnAs34v9qPLtaVQaRSPOvpjDTeg2
	 pNkzEWVBPAbjlj5QPN+1NBdJzx3r59DLe8McCfNjMWv1AvnGuUCaTsMKXplAAWUa0Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9drzNba;
	arc=none smtp.remote-ip=74.125.229.132
Received: from mail-dl2-f4.google.com (mail-dl2-f4.google.com [74.125.229.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4071A606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4071A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W9drzNba
Received: by mail-dl2-f4.google.com with SMTP id a92af1059eb24-1b573ae2265so402656c88.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627395; x=1796232195; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3cLFOviybsaEA5eYi5Q+NMk+ioo8WIGpCekkymZxlU=;
        b=W9drzNbaeta0MQOtE+aRVbWl3W5QqwPjJmejKDgdWqjarYgX3qXihFOfoQ9vE3r9Vl
         jXry/DkbyXmNBbkFq0mlHcEzHjD4PSCFVCV12jRb+8rSS86UrAepr8aKOno9GP2Q/jKR
         4+tB6MvJM1214hq5qFQsH6N0m0nX34dLx6/CIqdggFt0yXEYQ/a34DgWFwLNoIuW95Om
         D2OrT3+ReYZCHxRd+TweHyjhSelxwtWSbPhSRP76WTrni3MyRFr4/ioteoV0QrHyekR+
         hOpeww/h4KMV27Cp1fkmJbCYjHqpY/ue8M24Eq6Irx+rR6y+WQQkt6g2jB0vRzshOA31
         mMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627395; x=1796232195;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M3cLFOviybsaEA5eYi5Q+NMk+ioo8WIGpCekkymZxlU=;
        b=DugOZ64GWaWouOCxKgQ2uL/FxG6vvp9EvnxH3wLrHZNu8+SucVYXTkizfRMS8zLJiG
         l+f0IY1N2jLKGN2qpXIHWIKWf1Nc9MvcdOufuwvNSp60YYWxIdjPL+ZX8EOLeJL1bbPE
         v/1oTseZO58WhhXmVN/rj2DICWTN7Zvx+fjW63rXeWjvLh6BRxEstiZlsWAKXXCp+Y3W
         0N6yWoglqv8zhQWoppIK9YS1LFKyVHes6MF67sQ6DZ95vZ+W2Vd7N9z1nmp38vCV1/B2
         T63XQhECdtLCua9O0K1qU2FuSFEPF7CeNuSma8SqlSCK5Imak87ocLvP9iKht8mnVIuT
         eviQ==
X-Gm-Message-State: APuU4Z/FbWUIJu3gkxBSguixQTuLBv5Xs7vOXCSkAH41KcKQsSuvXgCf
	IKyT23VXzxQYfgWsJ9v3JKx8PuQbMXPY56OVk9OVe4sRp1dosrqSyJT5
X-Gm-Gg: AZFdTZcJJzgyi2grgqp5keBiCLKYmelJC9BVa6uyJvgrze35cJIQwIRc7nodMejqHJm
	m59lxPmJspv11AoYPX+VZQ3BFQwnHuUtfPuKfte7EgF5szyMK4/H738mDva1dX+Qkn7OCVV8qt5
	yB0UDBU851mN/gSSE7weQMx6lGaxfr0lBg3OBmoEy3oDbT0XupzcahL85Rew6NCSbbj+/FFRBFO
	T0+8aThXOJ22IaAsZlq4xpp7so1xN721ZZa7LPHxfPhq9CzocMh206V+K0Auud+SjfLKz+Qsp09
	QX7q5Vuii27X0et0syGVGvAJkIYlUh7kFqZ0D6HJendtbf/6JKCw91ujPhXdJqSN2OLkKqu6uDk
	P3DLFjNiFeZrGlByCtqu5Mc1AUUwaAKEOcmjIpmxHnQxy8jJdyqa/2qoIg8CIrENPrvEQ5QHUvd
	dRZXoae5vIoggr9/d03J4LUgCq3Ye5fKwu6ElxxXDkwzhuuk/gYSf27ntxVcG1BPldl0hiWo7lP
	3TF6nLQ9Ki8fo8ZF9Kk1m7eWlH65O+HyQIE6BaUXk33m34muy/h3ZblbBkO18l2HzuGBek1y88d
	MxgtEpzNMihK5OzDUG4r3jI=
X-Received: by 2002:a05:7022:3c0d:b0:1b5:39fb:c684 with SMTP id a92af1059eb24-1b556936838mr15116926c88.37.1795627395050;
        Wed, 25 Nov 2026 09:23:15 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm64804099c88.14.2026.11.25.09.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:23:14 -0800 (PST)
Date: Wed, 25 Nov 2026 09:12:05 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net-next 2/4] selftests: drv-net: add a closed-loop
 request-response test
Message-ID: <awcW5SPYScaQkCgc@devvm16445.scu0.facebook.com>
References: <20261123174120.505808-3-sdf@fomichev.me>
 <179554218233.3135.9733987891875533759@kernel.org>
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
In-Reply-To: <179554218233.3135.9733987891875533759@kernel.org>

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
> - [Medium] rr.py's closed_loop()/_report() pass the request-response
>   fields of KperfResult (rate, p25, p50, p90, p99, p999, p9999, lat_max)…
> - [Low] The commit author is 'Stanislav Fomichev <sdf.kernel@gmail.com>',
>   but the only Signed-off-by is 'Stanislav Fomichev <sdf@fomichev.me>'.
> 
> --
> 
> selftests: drv-net: add a closed-loop request-response test
> 
> This adds rr.py to the drv-net perf selftests. It runs kperf over one
> connection with 1 KiB requests and responses, then reports the
> transaction rate and kperf's latency percentiles and maximum as ksft
> metrics.
> 
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> [Severity: Low]
> This isn't a bug, but the author address and the sign-off address do
> not match:
> 
>   Author: Stanislav Fomichev <sdf.kernel@gmail.com>
>   Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> The body has no in-body From: line either, so checkpatch will report
> FROM_SIGN_OFF_MISMATCH. The other patches in the series have the same
> mismatch, including "selftests: drv-net: kperf: support
> request-response tests", "selftests: drv-net: add a kperf stream test"
> and "selftests: drv-net: remove the iperf performance test".
> 
> Could the author and the Signed-off-by use the same address?
> 
> > diff --git a/tools/testing/selftests/drivers/net/perf/rr.py b/tools/testing/selftests/drivers/net/perf/rr.py
> > new file mode 100755
> > index 0000000000000..1dff0c4763909
> > --- /dev/null
> > +++ b/tools/testing/selftests/drivers/net/perf/rr.py
> 
> [ ... ]
> 
> > +def _report(result) -> None:
> > +    ksft_metric("rate", result.rate, goal="higher")
> > +    ksft_metric("latency_p25", result.p25, goal="lower")
> > +    ksft_metric("latency_p50", result.p50, goal="lower")
> > +    ksft_metric("latency_p90", result.p90, goal="lower")
> > +    ksft_metric("latency_p99", result.p99, goal="lower")
> > +    ksft_metric("latency_p999", result.p999, goal="lower")
> > +    ksft_metric("latency_p9999", result.p9999, goal="lower")
> > +    ksft_metric("latency_max", result.lat_max, goal="lower")
> > +
> > +
> > +def closed_loop(cfg) -> None:
> > +    """Measure back-to-back transactions."""
> > +    with KperfRunner(cfg) as runner:
> > +        _report(runner.run(RR_ARGS))
> 
> [Severity: Medium]
> Can closed_loop() pass even though it never measured a rate or any
> latency?

Yes, it can pass. The (future) regression tracking will handle "no metrics
reported" situation.
