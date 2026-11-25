Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627395;
	b=B9q76/pYLOGvcQ++7VmSveZa/5IJwAbSVK+hrGAyDiJXVKp/WTa6LZxtEgNG9sDKaoKA
	 +UIVAcakBM1jPj5WLjr4BMXPbWCx+D2y2eggZVJDxfkQuIbmSBkEnyvwMJgUHW+HQniNd
	 pfZvNfLxI6hYYN1dgRf2teuHAZFP3Bn9OmMD7wAyEDD75RA6WJAstHvW0jXjKt6w7ryr1
	 1NrcgeeuF2LYmqq5MU+e1E73C3ldpk9w7AIvRH8f6byZm3HBPhU0Olo0oADKW5dJSBLE/
	 ej7b1eHhtCXaa6j4A0eD1sZPa8EoRD/H8GG4r1j1S+6XNf33vV/Xj3r9m0klKDWJiQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=S2FEFpqCJPq1bF4yMdG84xsMBjttnyc+/xbE8qpdjw8=;
	b=DLvfEoP38czMhaEZUYkK25ax8PFkvhu93HWjsYl2lgq8taLTrI8fhYC36wIsqEDl5Vlj
	 ghF/U2rz3opeV3VhjK9JHnnxeeBx3h2CrhitmDRqrsW3Gglr63Kb/R1eJuczrdeIdX1so
	 NeAVSssZmNBGEIX5znKfIApsK3Jst6acd7nolXrrVBG/w1nX5zNIAgBrNLS+1FldeauG6
	 POLzFkmaFnCRGf8OxJ9bj8jWiR4L557Kg+ezptNfYDJLyKDLt1WLuyX0gUpBAKZpss/F9
	 w/8CDQXZtnJ8g0XGUPrUgz82DXTOc1xU5KympJu2cD4SNUABSpLmia6MzwKHhhjCDxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EfpEI7mT;
	arc=none smtp.remote-ip=74.125.82.193
Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B14606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B14606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EfpEI7mT
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-386d1859e1cso750505eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627394; x=1796232194; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2FEFpqCJPq1bF4yMdG84xsMBjttnyc+/xbE8qpdjw8=;
        b=EfpEI7mT+B62T9+0R0oSGFSPjDXIuPq0zX/uBbvzjw+QSyJ1UWOajoOEzeYK8dL0Ux
         xDopzwRx/wRcmNPT7B0adN88m5CvZe4loLQ8zPR1o/Ww7LbDKlydCm3lER1YrsMwqgy9
         SFsDhLg/3CY+G/5AWbmgpVTAgezUq2Zh0A9c/ajxWs7MUWWJK2XkDJKXBTkvIn1B1pki
         5g4uU1dMsmuMqJgFuVNipGjzmo9s5+qVC15vqrM26mr6R/jZWU1Ayj0dnK2S6pJXRB9U
         lHK02ASO8DxdwtI0lf/15jwGItNFQ7ZA17Sru+aM5E/UTm9mD1JeUoNP6J1Jeu7I0VDC
         u0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627394; x=1796232194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S2FEFpqCJPq1bF4yMdG84xsMBjttnyc+/xbE8qpdjw8=;
        b=hZSaKBs9iJGKqTPMbuFEJKnoE0a8NGYMlEeLNDSeF9zItPJZ3VXOMylwKoo+6v+i/s
         3LeMoIv1FliJyskVZZxY+aZOKomkG2cQ/kKHUWCDFnBcO81iRR2fJ6IRTQUEo4cgUS+6
         Q0+GSOj0KDNy9hgVFQmWbCmGlTgvVWFqFRCKwIzOCQs58eP4REkDJEx0qIiaV8HJN2jj
         ZGdQUB6jjrpSO/fmw8non4dcOmSVcreMaByAPAkhbQr35Z93QhL99bue4fPJEXK+sfU6
         ug7b3Qj679IqP7H8isQ7LKLYtKTK37GM76KciWjtwUk7jUv0nKMUFRSMWmsLcBY1m+wk
         a7Aw==
X-Gm-Message-State: APuU4Z9FGAMe5H1CD7cPwC3l6I5nLHPzJozstDwxlNzQIfSFmS8VpW76
	SbwHeHSUnJ2C0XzvG7nLZHRr2o3D9qLYpms+A/4M9ATzIHsOItvF/9ES
X-Gm-Gg: AZFdTZerkkno3ljnB/kbM6rgZQn2GQaf8esnXqKT8wX4iloW/s+N8jyuTtet/vvhY8r
	laUpfr4bLZlqv096HRUDNsbhZbEX4cQeqiLtopbTiNZxBihxkJZ1sGaXh2EBKjMIqfYggouTTBQ
	HHHtqjBVbMTctUdiyN6tRnlSZpe+orWjpRVXrAcT4b6hGq3eQn9QMXZkULEO5wjWDU0IcY4UWV5
	GBXr/olmrmMDkMk3H1s4+77ii87vnNuEzC+Iz6/9Uqd7L/TYTQuwzSYn6HVE5sc9C8+IR2AIruQ
	In+kXTSBSAxO+O99hWoU9YDEAl2NzMInMJKgeXgekf9EKE+1e540ulngo49bcOxPabuUj2RBUM4
	GZ32cHx8X6HwDzSkalcbIban7gxqhcSHC2wqS2wOmrmdBsrbZmlyAw69qQKcayTGQR2rytMjMRI
	iP/X9Kra/IZvaIVgaIsMNel4URMhvT3wakZqeDukDM/xYsoBqO5Vc+rEFvpOEVo3Hp9+Y/q5Ren
	faBjmB4V/LrEhaKTmHiPSHNIJHM7MA1r299JpG6l0nn1kKVFo/SClXphp3hWmSFsglI9JFOAntL
	VcC4dSN0ecq+JoyafFiEig0=
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr17810827eec.11.1795627393994;
        Wed, 25 Nov 2026 09:23:13 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:42::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm42787023eec.1.2026.11.25.09.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:23:13 -0800 (PST)
Date: Wed, 25 Nov 2026 09:10:59 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com
Subject: Re: [PATCH net-next 1/4] selftests: drv-net: kperf: support
 request-response tests
Message-ID: <awcWo28PqdP3HQ/g@devvm16445.scu0.facebook.com>
References: <20261123174120.505808-2-sdf@fomichev.me>
 <179554218093.3135.7909843046565299383@kernel.org>
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
In-Reply-To: <179554218093.3135.7909843046565299383@kernel.org>

On 11/24, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The author and sign-off addresses do not match.
> - [Low] In KperfRunner.parse()
>   (tools/testing/selftests/drivers/net/lib/py/kperf.py), the commit…
> 
> --
> 
> selftests: drv-net: kperf: support request-response tests
> 
> This commit adds an optional transaction rate and latency percentiles to
> KperfResult for request-response tests. KperfRunner.parse() takes these
> values from the Source section of the kperf client output.
> 
> > Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> > [ ... ]
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> 
> [Severity: Low]
> This isn't a bug, but the author address and the Signed-off-by address
> are different. The author is sdf.kernel@gmail.com and the only sign-off
> uses sdf@fomichev.me.
> 
> checkpatch.pl reports this as FROM_SIGN_OFF_MISMATCH.
> 
> The other patches in the series have the same mismatch:
> 
>   selftests: drv-net: add a closed-loop request-response test
>   selftests: drv-net: add a kperf stream test
>   selftests: drv-net: remove the iperf performance test
> 
> Could the author be changed to sdf@fomichev.me, or a Signed-off-by be
> added with the gmail address?
> 
> > diff --git a/tools/testing/selftests/drivers/net/lib/py/kperf.py b/tools/testing/selftests/drivers/net/lib/py/kperf.py
> > index 8ee8c5ba2ff7b..98d27d83dee20 100644
> > --- a/tools/testing/selftests/drivers/net/lib/py/kperf.py
> > +++ b/tools/testing/selftests/drivers/net/lib/py/kperf.py
> 
> [ ... ]
> 
> > @@ -149,9 +165,20 @@ class KperfRunner:
> >                  if (section, direction) in (("Source", "Tx"),
> >                                               ("Target", "Rx")):
> >                      throughput[section].append(float(value))
> > +            if section != "Source":
> > +                continue
> > +
> > +            # Request-response tests run a single flow, take the first one
> > +            # and ignore the rest
> > +            match = _RPS_RE.search(line)
> > +            if match:
> > +                rr.setdefault("rate", float(match.group(1)))
> > +            for name, value in _LAT_RE.findall(line):
> > +                key = "lat_max" if name == "max" else name
> > +                rr.setdefault(key, float(value))
> 
> [Severity: Low]
> Does this really keep the first flow? The comment above says so, and so
> does the commit message:
> 
>   Request-response tests run a single flow; of more, the first
>   one is kept.
> 
> KperfRunner.parse() doesn't track where one flow ends and the next
> begins. It scans every line in the Source section. Each RPS and latency
> match is stored with rr.setdefault(key, ...), so what you get is the
> first occurrence of each metric. That is not the same as the metrics of
> the first flow.
> 
> Suppose the first flow's lines don't include every key (RPS, p25 through
> p9999, max). Or suppose kperf prints a summary RPS or latency line before
> the per-flow lines. Could one KperfResult then mix values from different
> flows, or from a summary line?
> 
> The KperfResult docstring also calls these values the source's rate and
> latencies. It doesn't mention that each one is taken per key.
> 
> rr.py is the only in-tree caller, and it passes "--num-connections 1", so
> the series as submitted doesn't hit this. Would it be worth stopping
> explicitly at the end of the first flow? The other option is to describe
> the per-key behaviour in the comment and in the KperfResult docstring.

"First reported by kperf", and we want callers to pass --num-connections
1, yes.
