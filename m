Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542182;
	b=eaEwaX30N4c6/0NgajcUtK9pj/N2vyrxmt472LjZube+fXofsa+kd+TT8T7mRDNtWDY9
	 sMDX0wVUQR9XB3REg/FWrRKKHypaUK1TC6qjZ2rCKcShtgypOypVgdx+dcr+b70tO/8OB
	 7NqpPPQ9YwSO6P1uHnRr2eLRb4hqPnBYtmTDqMxCXCdugjvfw5GJwvytbaXNaDx1Zc8ZZ
	 DbMtIEe6rgb4xoYBSpiafsFcrD01ahQCYQ6wR7rHrP7aEqrbq0sIzHlp7eBsQijMOH/sF
	 6JzwuanGNiq1i/JRWtwkLuKiD7+7/16GWcx+g2EE7PkgYZmdHjOREitlQhdd5wyklCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542182;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=rgu3DswXGXqLcQ4n55HY0sWzcCGdRSeDpNg/dQ3v/bM=;
	b=Oes/oVbGWEuAYuYtgTvVdOkq8H2tLg97dzNBWwXyWdToZLx/8TcNWXdYhpzrCtZec/9J
	 qkl/lmXy9hwziBxj9LpRyVAOOwESvhQW0mvQvO3tCU8Q0pzTqhVp8U0LQQtKWpsasAMpB
	 SKtz6kCuJ044aX8mptN7MUkI9Yho/VmHui88vvXds5PsRFXMzBeV6FZxesiJVaWHVILu0
	 TP7psGiHJAPfcacQqVojwFHEOEmlbg7NXm6Q5omP3R1zukRDMCjBtFDxxfmBILPE77Oce
	 j6zMl92mIw9Fcqnf9i7BBkZCD7/9SQhxvzoyOFb45ZyrpfMBmRUfv6HPXN7ofhP7DBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7RwYBLf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CEA606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P7RwYBLf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2EC1F000C0;
	Tue, 24 Nov 2026 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542181;
	bh=rgu3DswXGXqLcQ4n55HY0sWzcCGdRSeDpNg/dQ3v/bM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P7RwYBLfqo+1RJKntRXZFC0NBor6uHFtyNvIJGDWL5Yci9EnxJ/JQTouLKPccF4vv
	 NAtqVxoQO93hE5FzINLzH0gU++QeYIKHAIvr3ZI92kvFxcOi9NuJZROEOmwoBivqDp
	 nUpjASL8RyDIUe+lwOiPJvo6XHNFX8iM59lIdK892pG228F7dmxQq7S5VFZlslEgZk
	 opn/++RPFGNPj0n9JcL2tT0g/H48Rt4jjdAPZiNp4hGIAy02Plln+NXL956l4J1EmG
	 QwF+sl1yAikjsc69h89qMysD6aIK44rR7dJTRJVm5OO5geDagc1VLBfQddqeGyAUS7
	 6b10wa5hNdTvg==
Subject: Re: [PATCH net-next 1/4] selftests: drv-net: kperf: support
 request-response tests
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 17:43:00 +0000
Message-ID: <179554218093.3135.7909843046565299383@kernel.org>
In-Reply-To: <20261123174120.505808-2-sdf@fomichev.me>
References: <20261123174120.505808-2-sdf@fomichev.me>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The author and sign-off addresses do not match.
- [Low] In KperfRunner.parse()
  (tools/testing/selftests/drivers/net/lib/py/kperf.py), the commit…

--

selftests: drv-net: kperf: support request-response tests

This commit adds an optional transaction rate and latency percentiles to
KperfResult for request-response tests. KperfRunner.parse() takes these
values from the Source section of the kperf client output.

> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> [ ... ]
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

[Severity: Low]
This isn't a bug, but the author address and the Signed-off-by address
are different. The author is sdf.kernel@gmail.com and the only sign-off
uses sdf@fomichev.me.

checkpatch.pl reports this as FROM_SIGN_OFF_MISMATCH.

The other patches in the series have the same mismatch:

  selftests: drv-net: add a closed-loop request-response test
  selftests: drv-net: add a kperf stream test
  selftests: drv-net: remove the iperf performance test

Could the author be changed to sdf@fomichev.me, or a Signed-off-by be
added with the gmail address?

> diff --git a/tools/testing/selftests/drivers/net/lib/py/kperf.py b/tools/testing/selftests/drivers/net/lib/py/kperf.py
> index 8ee8c5ba2ff7b..98d27d83dee20 100644
> --- a/tools/testing/selftests/drivers/net/lib/py/kperf.py
> +++ b/tools/testing/selftests/drivers/net/lib/py/kperf.py

[ ... ]

> @@ -149,9 +165,20 @@ class KperfRunner:
>                  if (section, direction) in (("Source", "Tx"),
>                                               ("Target", "Rx")):
>                      throughput[section].append(float(value))
> +            if section != "Source":
> +                continue
> +
> +            # Request-response tests run a single flow, take the first one
> +            # and ignore the rest
> +            match = _RPS_RE.search(line)
> +            if match:
> +                rr.setdefault("rate", float(match.group(1)))
> +            for name, value in _LAT_RE.findall(line):
> +                key = "lat_max" if name == "max" else name
> +                rr.setdefault(key, float(value))

[Severity: Low]
Does this really keep the first flow? The comment above says so, and so
does the commit message:

  Request-response tests run a single flow; of more, the first
  one is kept.

KperfRunner.parse() doesn't track where one flow ends and the next
begins. It scans every line in the Source section. Each RPS and latency
match is stored with rr.setdefault(key, ...), so what you get is the
first occurrence of each metric. That is not the same as the metrics of
the first flow.

Suppose the first flow's lines don't include every key (RPS, p25 through
p9999, max). Or suppose kperf prints a summary RPS or latency line before
the per-flow lines. Could one KperfResult then mix values from different
flows, or from a summary line?

The KperfResult docstring also calls these values the source's rate and
latencies. It doesn't mention that each one is taken per key.

rr.py is the only in-tree caller, and it passes "--num-connections 1", so
the series as submitted doesn't hit this. Would it be worth stopping
explicitly at the end of the first flow? The other option is to describe
the per-key behaviour in the comment and in the KperfResult docstring.

>  
>          if not all(throughput.values()):
>              raise ValueError("incomplete kperf result")
>  
>          return KperfResult(sum(throughput["Source"]),
> -                           sum(throughput["Target"]))
> +                           sum(throughput["Target"]), **rr)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123174120.505808-1-sdf%40fomichev.me
