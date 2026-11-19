Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127061;
	b=iNaBaKcXcfusp2hY9EZTUsUk4fPrCgOrf0K2RadyBi9PuqMJugICgr0ShUdsAs5+YPtK
	 Ps21c7+AKYv6yptj3Y2gJMFOqgbGkdoRHDDr0OqJoO/JtED71mNZ8+yBTVnD/jpFRwJd8
	 z4LHoGLdyeaC3wrjeqluvTTdctRAEsbwPSbxlxNIfAky1i02uvvBYTfJhGQiXgMn/Yj0D
	 btUDTrigFeAUXtFKihtwHrXBKKdYj882aUXlfyNTVe2jE1F6VIr5M1wES5bb6BL5LmApq
	 GLVrk4yc0nlzYJcEnRVfgjUOs5DfinYeBg0MD8vz4EY5jfsBv1fgjNoxPfm57kXA43g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127061;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fYKEgZx9a2Gppc4NBUi0/c5lafRQKy+TzPob86FA5DM=;
	b=eMA3HENs0QZWYjceD1QdCZGYEtE4i4hn6r7aD556vntw6DjX/MU59xvnY4XCd+s2ma6l
	 H83HR2btea3rO1gqx7+jH2F/Zgc3qzAL35iclmyqZnehc/ssEkvLmA8l8hhMCVzIdjkaF
	 U6I38BiORyn8WvXlz0PnLAdeUCCe9xpjmjLWXLEL7mlikMBjeuqyuHRTIWnqXKxUznu/J
	 onPVAUlYs8MUtubmIIgiFzwPq6qv28oiN7QrbNI8OGDqLaK8dpF65dSS8zasZo7OsLTXe
	 i0hO+1dC+lXvhlUIUcx3G8QsNcP3HBiWJufkYNJOgGbQBed1AAhVdnryZn2YIi8f8ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OV9igYyr;
	arc=none smtp.remote-ip=95.215.58.228
Received: from mta1.migadu.com (out-228.mta1.migadu.com [95.215.58.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99632606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99632606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OV9igYyr
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jkwvPhHK1HiBXd3GktFSZ5VXaiZz/TgsOz9HPjukXdk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795127058; v=1; x=1795731858;
 b=OV9igYyrM7FIeiDEMAOabNvFsqQVQ+T4Q48swIWEvANPzWZ17Z4dNwe9tGx+x4Z5nl4ghpMY
 I8RNtNqluR21nO9vs03+Svaa/x2RSCsL7wtV5mIyHXZrJOxwWAzPtvx2xDHaCbMAVPAmAjc/TQ5
 +RofbXzBHmD1eM6JoBBfNCzQ=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2741b7962c2aa253;
	Thu, 19 Nov 2026 22:24:18 +0000
X-Mizu-Trace-ID: 2741b7962c2aa253
X-Migadu-Flow: FLOW_OUT
Message-ID: <acbd7123-7a9e-4c4d-ad37-d1e8c6c5cd84@linux.dev>
Date: Thu, 19 Nov 2026 22:24:17 +0000
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
Subject: Re: [PATCH net v2 4/4] ptp: ocp: correct the DCF output frequency
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org,
 richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch, arkadiusz.kubalewski@intel.com,
 davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us, kuba@kernel.org,
 pabeni@redhat.com
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
 <20261119-timecard-common-v2-078fe69f33-4-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-4-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/11/2026 21:19, Ahmad Byagowi wrote:
> The output selector table uses 77000 Hz for DCF, whereas the input table
> and the DPLL supported frequency list use 77500 Hz. A request for the
> advertised DCF77 frequency consequently fails on an output, and reading
> that output reports a frequency outside its advertised set.
> 
> Use 77500 Hz for the DCF output selector as well.
> 
> Reported by the netdev Sashiko AI review and confirmed by code
> inspection. Source-derived C regression tests pass with ASan/UBSan;
> restoring the faulty selector, mask, disabled-state or DCF value makes
> the corresponding regression fail. Tests use stubbed MMIO, not hardware.
> The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
> physical card was tested.
> 
> Codex prepared the fix, tests and changelog from the review and upstream
> source, at the request to separate common-driver fixes from WiWi support
> and validate removal ordering.
> 
> Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
> Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
> Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
> ---
>   drivers/ptp/ptp_ocp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 06d05fac6e..0d3d9ffd1f 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
> @@ -1375,7 +1375,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
>   	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
>   	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
>   	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
> -	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
> +	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
>   	{ .name = "GEN1",	.value = 0x0040 },
>   	{ .name = "GEN2",	.value = 0x0080 },
>   	{ .name = "GEN3",	.value = 0x0100 },

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
