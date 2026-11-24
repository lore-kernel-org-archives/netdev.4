Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542183;
	b=c0kxd6uM5uDxUrDZmOI+UGjuFpDMcqBOvKukLcLK0y8gje+q7iKJgToKyV0jH/zcZwcR
	 j+4xdqJHu6ZLZizpKaxO0y/86th3AR6keJQjXcg4uv2UteZNRLQlvjUA2e4zg5aPfl+9o
	 aLkTwZw7T0SiigM/HNfAEvKWH/66QhY49m3so+varxpUTo6ssyXXFIDwVhjLtI0mXsq0G
	 Gr9vg/ScXrxKmoaTnh8Nt8eFvNEBmGbB5o50kXrBbc7b1+LL5JZyLqK8Zm4HGwff4egt5
	 ZwLcZcl8QM9P1MGvMgZ0P2SeiKvaoeK1wbtaWVa4d+iUzOXB2CZo+KWdknTEx17nbTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542183;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=VksyioOuiR2X3CLr4BcOFUMBPgzZy3r3sJ76Pa906yU=;
	b=AyNV3OxjGxfJuloI8BbMWZSdJgLOPMAqzBerssuk1xTKysIK1m051KJPUy5WFHUKyjd7
	 ac4kxaub4VuEuL5ebMQkCrYIQwuEC6CE5y21I8I1BHgPAV8LrQxD2r4jmF6ozdQgIU1pO
	 NnRRglrWGY7dT0tj29d9rkdvVbIuVrLVJ91b2OUJjVRp393xGolOlCUG1nZs5J+LIS8nc
	 kYQLfkMmW4epdddtAbHrK7hrbJcwEzaBkCI3GF/1fjf7R626iuwtODn5iwRtCzAG+HOXx
	 KHXFL66o80TjJD0Nr8XCcVtU7IvxOvoVWXCqW5HlWZ3CPld529I8jrrxWVlToyGmxRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kGb83NcK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC644606A332
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kGb83NcK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0921F000C0;
	Tue, 24 Nov 2026 17:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542183;
	bh=VksyioOuiR2X3CLr4BcOFUMBPgzZy3r3sJ76Pa906yU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kGb83NcK8zpC7Nxg3q9J+2f8+jw/u/MJKchAz/zjZI7L+KR8WkZO7WtUcFGIqv9XZ
	 kdyzQLVkgNThvHan98NJcdXgoDXTFB1bMeBFsQqHYpoakNycb9BsTiliAHRq3hDLcu
	 TQuxHS4Cws3YuOqjUC8JTMqX0V7AsP5fN4NEbQvhcplNgdD23P6qF+ObtsY+fcEmIG
	 UhmOudUSP+eTM29WGtIpH6RXJ+3L6NZlCE0IEHoEvCr3CzlfU3BKgV0bv1oMESSiky
	 6i1vRdp1qrE5l3/YKqNbHCurFHI678lpIPr97RCRcrL/OQK5lV7/YXXRLzev5Knvta
	 r/O8euH7Bc0uA==
Subject: Re: [PATCH net-next 2/4] selftests: drv-net: add a closed-loop
 request-response test
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Date: Tue, 24 Nov 2026 17:43:02 +0000
Message-ID: <179554218233.3135.9733987891875533759@kernel.org>
In-Reply-To: <20261123174120.505808-3-sdf@fomichev.me>
References: <20261123174120.505808-3-sdf@fomichev.me>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] rr.py's closed_loop()/_report() pass the request-response
  fields of KperfResult (rate, p25, p50, p90, p99, p999, p9999, lat_max)…
- [Low] The commit author is 'Stanislav Fomichev <sdf.kernel@gmail.com>',
  but the only Signed-off-by is 'Stanislav Fomichev <sdf@fomichev.me>'.

--

selftests: drv-net: add a closed-loop request-response test

This adds rr.py to the drv-net perf selftests. It runs kperf over one
connection with 1 KiB requests and responses, then reports the
transaction rate and kperf's latency percentiles and maximum as ksft
metrics.

> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

[Severity: Low]
This isn't a bug, but the author address and the sign-off address do
not match:

  Author: Stanislav Fomichev <sdf.kernel@gmail.com>
  Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

The body has no in-body From: line either, so checkpatch will report
FROM_SIGN_OFF_MISMATCH. The other patches in the series have the same
mismatch, including "selftests: drv-net: kperf: support
request-response tests", "selftests: drv-net: add a kperf stream test"
and "selftests: drv-net: remove the iperf performance test".

Could the author and the Signed-off-by use the same address?

> diff --git a/tools/testing/selftests/drivers/net/perf/rr.py b/tools/testing/selftests/drivers/net/perf/rr.py
> new file mode 100755
> index 0000000000000..1dff0c4763909
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/net/perf/rr.py

[ ... ]

> +def _report(result) -> None:
> +    ksft_metric("rate", result.rate, goal="higher")
> +    ksft_metric("latency_p25", result.p25, goal="lower")
> +    ksft_metric("latency_p50", result.p50, goal="lower")
> +    ksft_metric("latency_p90", result.p90, goal="lower")
> +    ksft_metric("latency_p99", result.p99, goal="lower")
> +    ksft_metric("latency_p999", result.p999, goal="lower")
> +    ksft_metric("latency_p9999", result.p9999, goal="lower")
> +    ksft_metric("latency_max", result.lat_max, goal="lower")
> +
> +
> +def closed_loop(cfg) -> None:
> +    """Measure back-to-back transactions."""
> +    with KperfRunner(cfg) as runner:
> +        _report(runner.run(RR_ARGS))

[Severity: Medium]
Can closed_loop() pass even though it never measured a rate or any
latency?

In KperfResult in drivers/net/lib/py/kperf.py, the request-response
fields default to None:

    rate: Optional[float] = None
    p25: Optional[float] = None
    ...
    lat_max: Optional[float] = None

KperfRunner.parse() only fills them through rr.setdefault() when
_RPS_RE or _LAT_RE matches a line in the Source section. Its only
completeness check covers throughput:

        if not all(throughput.values()):
            raise ValueError("incomplete kperf result")

        return KperfResult(sum(throughput["Source"]),
                           sum(throughput["Target"]), **rr)

Suppose kperf-client prints the Source Tx and Target Rx Gbps lines but
no "N RPS" line and no pXX:Nus or max:Nus tokens. That could happen
with a kperf build whose output does not match the regexes, or one
that ignores --time-stats 2. Each field passed to ksft_metric() is
then None.

ksft_metric() uses json.dumps(..., allow_nan=False), which rejects
only NaN and Inf. None is written as "value":null without an error.
Metrics also do not affect the test result, so closed_loop() is
reported as ok.

Consumers of the metric output then see null, while the ksft_metric()
docstring ("value - the measured number") and README.rst promise a
number. The later patches in the series do not change rr.py or
KperfRunner.parse(), so this is still the case at the end of the
series.

Would it make sense to check each field with ksft_not_none(), or to
raise KsftFailEx or KsftSkipEx when a field is None, before reporting
it?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123174120.505808-1-sdf%40fomichev.me
