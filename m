Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111010;
	b=0U0HAQTdaaXmtQeLgddQO3cbCHNIwPZJdzPp9NNZZIiXYRFc8Ucm+ufoQktsRxS57zys
	 1nXXfCQMA3IyBo3u4/ge6VtkFuYi8WJ4ZYcd4VAwyHV1QPx25WCqlS/CNSjJY4/sZGQMv
	 Wfv+h2nwSEIf8S95X2RRNGUjuz4EuwAq13q1TDnmF0/nwt24KUtX7kK4/hgGMpMukcLlj
	 FdPVFtkCqaDclxzR7e9v9JL7wZRdqtU76CDTX2b4xhhntGcDBpYo6TPoRiCNLXBelIi/d
	 +YxgZsmwrdkuAFgoXfiJPLiqnnCHUpGtHsA4qc9KVmswjRPKDhB5JX15bmJYiTKJoiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=E2NIbmhTtrAS7wmJW7mkUM6cARcKD/LGZwOXlgRTQsI=;
	b=IA4pIlRDbHSumYZhWX9IRJiT1SP5JSL3rMTbB5mvla0spaQqkPK8dOh4PxyphUY5FRXI
	 i/3DH1S9/R4p6CvYVEgfTb+DWAcnMnE96KssXWi0exBHoDB1BaSaprUUZRTRc0+H5gNGj
	 YAbbx+nLhJBxkH2bPyIhPZfBtiNOmkM6gdtpkPv5XJophZDL0ld09dV2EWOgtna/NG4Wt
	 t8DnpoWKTbf1I4ddeTdT8TDV1PugAHoD17bjzMJfxvkVMbRD95bpUOGr7dbBfVv/nSZkL
	 jmq9VqiwpTh5MtJOsyunJUnFRwGGywoGMu7ldoks5KruUSbiq4280VXLicUzO4VOAbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMtMwajo;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1618606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1618606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMtMwajo
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3acec6677so3643735c88.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111009; x=1795715809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2NIbmhTtrAS7wmJW7mkUM6cARcKD/LGZwOXlgRTQsI=;
        b=cMtMwajomCbRVs7vFzFO+TVH7BBmXvJ6KhEOdHb24rMRDDivQa4ovhTh+ohAbTbD10
         2wcMWdnjrJqtkoxuieDUiigbcMjfipl+dsU/AqwcjTpjiXSGey79EsbmxzJxrVYhSedK
         oXyHitLgTWKd89l9EaUK/SUo9UszWgaxDTLpHSNOw3iHBRcbcbrgWcYo4DDPOCrAKd4A
         5s0Q0GkFBqhP58ii3+pp8uj7O4q88/+h5OEreWP6zAXqL1EqoOoSJL3K1mZhWDkdZIo8
         hGcFNg/rmNAGqoKHsSD+3pvsUHr3KL3slHwvGpH5gIs4NlaTuGQBR6nRVX4njna/V4Bu
         xREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111009; x=1795715809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E2NIbmhTtrAS7wmJW7mkUM6cARcKD/LGZwOXlgRTQsI=;
        b=2gHiI9wm1LaK9Tqj1ytBSnuhbslGDwXKhqeTz2y8J6JqKHHkbAIHloQM1yYo+xzjAr
         eWv7Xc636DJiUOhCHcE4APd3uZnE/mxUSgcbMRTOcK0PbgzmnqwWT1e1AKnqDuai3FQs
         DpMQidXLA1pkRTAWcefe2O4qlxInsUX/PZvc+wrCNrSqQH3nKS8sJbL+jgMKayJWLsnH
         nkwNV8SoinJcbp+BnS+u0RT96h+5I9XxoJ3012IKUM9AEEY7vkMAIbmBmFG2KZhV4OpQ
         qL7V3PZrY3hiyKFkeWP8SoUeSJ8JxOt29zqtZuERtBmHGae8O2kf8V7UJcb5qEP5FUMw
         oqWQ==
X-Forwarded-Encrypted: i=1; AL+hErG9X+L+bnDiiyum8PjF63cWcuSF/CqC/yfawct8hJE04HwzHDXuA2fKVQH7GNdsnfmSp89Jr0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uOu5Q+IdIb3mDwCKESertJi59s2lXI+WgxvABC1Z9SkwoAwRM
	/UhGqvD6862zySm/ideb3X6tJdM2jb9i0FdgxzGP0/GFR0qhNuo6Ki+J
X-Gm-Gg: AYBFou1Tu3bxwczRq7ojxmenw0zF8YSJ4OGDyrxCNTM/xrU0R4FwvnhfGOhA5BMpBWs
	YNp4mVTAfFD0aKuO42ID36oDHSpdxm6jMdP/VzqxY6bdF0KzsUwgaZ6cABsN2xPiYW19Fq4bzi5
	TLl25+L22zfXGMEaDce0i9/t635YtjDCCanVbF+yxOIrBJwq6qLNAoxH4YKlpVtX+ceRHc6Iwmy
	a9CKeHcK72C2xSp7wVFlwb1XZJrhuGAOwK2gtxUWe0kdaAc9dic/YxUIY3aDiCT8xOnzAlEn68T
	Hur1ruBeKUwxD4Z5T6/FJnx/hwB8yQ4xILd7t6Ew/DUqp/XisPJ9fngxAvEi5gaIn4Vjk+h8tZ+
	a3c1jGdHjjQISXUoe21GCGSYJ3elKVsefoUZecuGjN6IVJUnG4BowxvcgzR59Ha/Cu0sK7ZAVaz
	x0AvsZYoap7Fh3Y26T7ylZTTRviMmXdl7Y36tyXBPF46QIBaOQ3Y6w58TFuUAk4e5Gjxbtocg7l
	U62SclOIUK8k9WyNAYsR4mFLaWFCnoZlIIqt5p4IfRYl2u70MEfC8T336BhY7jEFRp17QE3QZtW
	0p5ZDHE5Y9cI+sDx5XoYysYDRmP1ZBkNJ1sQmcJyNR38Q29ndLpRj5PYzFNE7o3Wjt124W65KYX
	ewLyW/pAXRYAwCMZx
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr351438c88.10.1795111008699;
        Thu, 19 Nov 2026 09:56:48 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::7:3ffc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm741715c88.12.2026.11.19.09.56.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:56:48 -0800 (PST)
Message-ID: <e10e6b18-ec08-4f21-b972-b63c73ddfb25@gmail.com>
Date: Thu, 19 Nov 2026 09:56:47 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 5/5] selftests: drv-net: stats: query timestamping
 stats while down
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, alexanderduyck@fb.com, kuba@kernel.org,
 kernel-team@meta.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 pabeni@redhat.com, shuah@kernel.org, hmohsin@meta.com,
 mike.marciniszyn@gmail.com, sdf@fomichev.me, bobbyeshleman@meta.com,
 bjorn@kernel.org, leitao@debian.org, horms@kernel.org,
 almasrymina@google.com, vadim.fedorenko@linux.dev, daskald@meta.com,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261117215416.1901246-6-dimitri.daskalakis1@gmail.com>
 <179508206338.3136.8445234401487583362@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <179508206338.3136.8445234401487583362@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/19/26 1:54 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] In check_down_ts_stats()
>   (tools/testing/selftests/drivers/net/stats.py), if a counter present…
> 
> --
> 
> selftests: drv-net: stats: query timestamping stats while down
> 
> This patch adds check_down_ts_stats() to the drv-net stats selftest. The
> test reads timestamping stats over ethtool netlink before and after taking
> the link down. It then checks that no counter went backwards.
> 
>> diff --git a/tools/testing/selftests/drivers/net/stats.py b/tools/testing/selftests/drivers/net/stats.py
>> index b08e4d48b15ce..e61db30b51817 100755
>> --- a/tools/testing/selftests/drivers/net/stats.py
>> +++ b/tools/testing/selftests/drivers/net/stats.py
>> @@ -220,6 +220,28 @@ def check_down(cfg) -> None:
> 
> [ ... ]
> 
>> +    ip(f"link set dev {cfg.dev['ifname']} down")
>> +    defer(ip, f"link set dev {cfg.dev['ifname']} up")
>> +
>> +    stats2 = ethnl.tsinfo_get(req).get("stats", {})
>> +    for k in stats:
>> +        ksft_ge(stats2[k], stats[k], comment=f"{k} went backwards on device down")
> 
> [Severity: Low]
> What happens here if a counter that was reported while the link was up is
> missing from the reply after ifdown?
> 
> The kernel only puts counters in the reply when the driver filled them in.
> tsinfo_prepare_data() resets every counter on each query:
> 
> net/ethtool/tsinfo.c:tsinfo_prepare_data() {
>     ...
> 	ethtool_stats_init((u64 *)&data->stats,
> 				   sizeof(data->stats) / sizeof(u64));
>     ...
> }
> 
> Then tsinfo_put_stat() skips any counter that is still unset:
> 
> net/ethtool/tsinfo.c:tsinfo_put_stat() {
> 	if (val == ETHTOOL_STAT_NOT_SET)
> 		return 0;
>     ...
> }
> 
> So the second reply can contain fewer keys than the first. When that
> happens, stats2[k] raises KeyError before ksft_ge() runs.
> 
> This already happens with wangxun ngbe/txgbe. On ifdown, ngbe_close() and
> txgbe_close() call wx_ptp_stop(), which does:
> 
> 	if (wx->ptp_clock) {
> 		ptp_clock_unregister(wx->ptp_clock);
> 		wx->ptp_clock = NULL;
> 		...
> 	}
> 
> After that, wx_get_ptp_stats() fills nothing while the link is down:
> 
> 	if (wx->ptp_clock) {
> 		ts_stats->pkts = wx->tx_hwtstamp_pkts;
> 		...
> 	}
> 
> ksft_run() catches the KeyError and still marks the test as failed. The
> output is a Python traceback, though, and not the "went backwards on device
> down" message.
> 
> Would it be better to check that the key is present first, for example
> with ksft_in(k, stats2, ...), before calling ksft_ge()?
> 
> Also, when ETHTOOL_FLAG_STATS is set, tsinfo_fill_reply()->tsinfo_put_stats()
> always adds the stats nest to the reply. The {} default in
> .get("stats", {}) therefore never takes effect, and it can be dropped.
> 

The preference is for the test to fail, as this is unexpected behavior.
