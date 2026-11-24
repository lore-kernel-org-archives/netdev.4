Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560028;
	b=HdwH5D23iJPYEtZ0mTe6o14VZZQMRxmkLBW3TDYyrZDfrEImPQx8F7S7ebEyr45k9Uyz
	 wCZ7GJSTK4hSbCGkpUkdXBm0jHCaMlTzn4SOoXcn4fNkfW1QUJqdAjxsvU9nwsw7eg3f1
	 6dbOLWzUYk9N8O9wC7impd/O2/deN6tG2G3CO5+gaSS9LdvkUaBP6E7jnQO3TgUSGeqMo
	 +zfJOqllKnaAEy+OkNU9S8DCd/z73ncv6ljp+WD/efhdox+EwEymGW4/FhfCek+bdlEm8
	 HdLKRZdG/jXj/kTsra0RJ986p1qGpnKV9mz8uaXVLUvIAsrtd8XcrwZhngTbCddSQhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JOCmGA8B2Uq2+zJvRdES8SJMT4yxwQscY2TEqlok9v8=;
	b=q432MsxeFX+Y5q8PirAUhAFG8IZc0qAEOKP8NpgSjPLAeCk4boSVYtmcYcogMNMHlKps
	 hEqQlypNomI0qic41+1tNKewqNVbEGAYXZseiH6DUNEFyO02Le7QxF3a82ftzP72jrZFZ
	 6789CdAjPnalBKL2aHVv13RWu1k3z5wCHSpD3QSu7SFZvUYEQWip0+xwGP07Cp6UDv2wx
	 FcD6E4k0bs/QdqHt5ZXynkbW48ZpFefWpv7lmTAewRyCLnWib5MTtk5K95y0YqjGbidc3
	 fgUXnG+ioJe+NvvCx0Po8ySfTVwRFQGcX/cBruRdpTwm0laJ3kg3ovNsqKRsAl7reAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7v6WinU;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2276606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2276606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r7v6WinU
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so2780987f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560026; x=1796164826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOCmGA8B2Uq2+zJvRdES8SJMT4yxwQscY2TEqlok9v8=;
        b=r7v6WinUGeszRtkezT8nV0OpkmQgAlO4t/Ibf501kbCTo/8E+GKetj06QTOMER3U5s
         SA+CG69s0yLb4+xw+xht5D18dC+Am7pihj5SF1FkQJVm08VQAJAil44npdi+zbbW7+mk
         eR/JCCvpx8PCuRy1YevgOn6QVYr+2i/eXykSGfWm8tAxA2MCGtdPVJCDKxXf6dsjQ8rd
         K8hj5VzdozXuKqDXK8ln4LAoqYds8FXQWMcE1GsKS66IR7+k3574QvbutwQjIMbLKJ6I
         6TwiyYli6edRu6mZH14diI/7/jRD8odHiTmp2CxJU8POl0elMOnDvFAJs9f1AuW7DDwH
         77nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560026; x=1796164826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOCmGA8B2Uq2+zJvRdES8SJMT4yxwQscY2TEqlok9v8=;
        b=x88oCPf1QI5VwM3lMSU0RqT6Eg4/95MGvu/PYu0Ezmvc8QWcijh7UZ1jKagivkKDDg
         6ZkJhe+gjTmzrmmCh+O5n0HEy8NmbBXqbk3RJu12A+xtXA+kMYgoJ0geYkoPYuS9luc2
         cQmn5TMtxyb6tH2F/8qAEohu5sIhplTjd+2jNzKXYmnpbdjOqSaAoPxHjBNcGKSd9vxI
         zd8zdkA4HJt912R5N5fqBSTTSfZS+uxVKR45DCnFHQ6Wt9LAkB7t8/DEC0IwT2zM7C+t
         s7/FlpcN+Ft6h9VIbpj+bWGHDvg+CFdGtHwh75NgYwTllLJwdL6Cbs1suFhpEKL/f1qW
         Fq0Q==
X-Forwarded-Encrypted: i=1; AL+hErGs9DpkNLXCe8eBJ4DSLJ2f5Za4fAQ1nQKTTY2BD19wnr1uaeDPu69KdZhbamfQnB4RF8vlLuE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4lnLcdpDhkYWBQgwWN5d15EIm4B3acDgbl9qsBB9pwgSizVCt
	UGPT4+zh5yJ3GlNKKHxRfESucfyTNtzlXyT8WfWrm6oPTdxhj8+h36tm
X-Gm-Gg: AZFdTZczX6wLfRaZMBP2zvrDYW8RpR87PgGF+HkYX87NpGojI37rNlCXaVUUEbn0v2N
	Zh/UZQTK7K/y9f8p1xU0s1TXr1iukjyyCzFZZDYJwW+jIiYIfe3/vnn9wH0PfZgoCz7FEyeSlRX
	JWz2QfauJA4POuAe1c17i6j9WgET5uI+4BVoBYz7qaTi94uDZPaQWVvpsJNo4/czLFN/TSsXBj1
	69Pg2SBjp5gOTXVnWna5jge6N53LFoTYazTjuf62drbdBI2jsUcfbk7G2bKOQ3KsO44yQutiAVB
	NPBSWiWf0Bcck6hVPw4QJmo/RAb2/Y7ZERd58tBbSphIHBbed/EpWGEg6yOi0bMkBm/4CWTBu98
	/rd/Br+HL4TPaauK74V00E3K56wwr+GuGFiwuSyADimPNb614OUauaNjJrpGeJFTrg16EIgrEeW
	8ksWwHl1ucKrSQ9kapA+/+RQHp7IQnAVBKfCtUcTqf8jb6RBTOImSsCCn0/qWo18B2zNKBdJKGt
	iLNveK2bl/GNxxnElZ+sCuUy/labPSjmyukR1rZFBP/YO4EV5u4iL1IGfnwJ7lNTyw3ScSdNK55
	AC8B1qRih3Srbi05zNqPivDuzFrPNq21Ek2kldM=
X-Received: by 2002:a05:6000:3107:b0:4aa:1ae2:ff2a with SMTP id ffacd0b85a97d-4abaa977260mr38417929f8f.2.1795560025876;
        Tue, 24 Nov 2026 14:40:25 -0800 (PST)
Received: from [10.86.0.4] ([185.13.181.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm30861494f8f.44.2026.11.24.14.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 14:40:25 -0800 (PST)
Message-ID: <9e637227-030e-46a5-9a95-91956e5219af@gmail.com>
Date: Tue, 24 Nov 2026 23:40:25 +0100
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
Subject: Re: [PATCH net v3] ipv6: fix ioam6_id_wide sysctl on 32-bit
 architectures
To: Shashank Mohan Jain <jain.sm@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Joel Granados
 <joel.granados@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261123023036.88754-1-jain.sm@gmail.com>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20261123023036.88754-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 03:30, Shashank Mohan Jain wrote:
> net.ipv6.ioam6_id_wide stores a u64 (netns_sysctl_ipv6.ioam6_id_wide),
> but its table entry uses proc_doulongvec_minmax() with .maxlen =
> sizeof(u64) and .extra2 pointing at a u64. On 32-bit, unsigned long is
> 4 bytes, so the handler treats the field as a vector of two 32-bit
> values and reads the u64 max through an unsigned long pointer:
> 
>   - reading prints two numbers ("4294967295 16777215" by default on
>     little-endian);
>   - writing one value only replaces one half of the u64: on
>     little-endian "echo 5 >" leaves 0x00ffffff00000005; on big-endian it
>     sets the upper half, and the range check uses the upper word of
>     ioam6_id_wide_max (0x00ffffff).
> 
> The wide namespace ID emitted in IOAM trace data is then not the
> configured value. Same class of issue as commit 162cf592b577
> ("net/smc: fix limit_smc_hs sysctl on big-endian architecture").
> 
> There is no u64 variant of proc_doulongvec_minmax(), so add a small
> local handler. On 64-bit it calls proc_doulongvec_minmax() as before,
> so nothing changes there. On 32-bit it goes through proc_dostring() and
> kstrtou64(): it reads and writes one value, parses it with base 0
> (decimal, hex or octal), accepts surrounding white space, and returns
> -EINVAL for a value above IOAM6_DEFAULT_ID_WIDE, for a write of only
> "\n", and for a write of 24 bytes or more. A generic u64 helper in
> kernel/sysctl.c would be a larger change for net and stable; it can
> follow in net-next.
> 
> The 32-bit parser is not identical to proc_doulongvec_minmax() for
> unusual input: a second value after a space is rejected rather than
> ignored, and a leading "+" is accepted. As the sysctl did not work on
> 32-bit before, this only affects input that was already broken there.
> 
> The bug was discovered by an AI coding agent (Claude Code) reading the
> code. It was confirmed and the fix tested on i386 and x86_64 kernels
> under QEMU, with a small static test program as init: before the fix,
> i386 reads "4294967295 16777215", and after "echo 5" it reads
> "5 16777215". With the fix, i386 reads and writes a single 64-bit value,
> and x86_64 behaves exactly as before. No kernel change was needed to
> reproduce it.
> 
> Fixes: 9ee11f0fff20 ("ipv6: ioam: Data plane support for Pre-allocated Trace")
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> v3:
>   - Keep proc_doulongvec_minmax() on 64-bit, so 64-bit parsing does not
>     change at all; the string based parser is used on 32-bit only
>     (Sashiko review of v2 listed several 64-bit parsing differences).
>   - Set .procname in the temporary table, so the sysctl write warning
>     names ioam6_id_wide (Sashiko review of v2).
> v2: https://lore.kernel.org/netdev/20261122013848.14287-1-jain.sm@gmail.com/
>   - Keep -EINVAL for a write of only "\n", as before; a continued write
>     at a non-zero offset in strict mode is still ignored (Justin Iurman).
>   - Changelog: describe how the bug was found and how the fix was tested
>     in plain English, instead of an Assisted-by tag.
>   - Cc the sysctl maintainers.
> v1: https://lore.kernel.org/netdev/20261118042958.83243-1-jain.sm@gmail.com/
> 
> Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5).
> 
> Tested on net.git main af6737b90668: x86_64 and i386 defconfig builds,
> plus a build-only 32-bit big-endian powerpc (pmac32_defconfig). W=1
> shows no warnings for sysctl_net_ipv6.o before or after.
> Under QEMU (TCG) with a small static test program as init, x86_64 gives
> exactly the same output as the unpatched kernel for every case. i386
> reads and writes one 64-bit value, with the same results as v2. With
> sysctl_writes_strict=0, the "file position was not 0" warning names
> ioam6_id_wide on i386, as it does on x86_64.
> The big-endian kernel was built only, not run.
> 
> I did not add Cc: stable; please add it if you think it fits.
> 
>   net/ipv6/sysctl_net_ipv6.c | 49 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
> index 1a0a36dcda..c93ccf7e98 100644
> --- a/net/ipv6/sysctl_net_ipv6.c
> +++ b/net/ipv6/sysctl_net_ipv6.c
> @@ -30,6 +30,53 @@ static u32 rt6_multipath_hash_fields_all_mask =
>   static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
>   static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
>   
> +/* unsigned long is 32-bit on some arches, so handle the u64 here */
> +static int proc_ioam6_id_wide(const struct ctl_table *table, int write,
> +			      void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	u64 *valp = table->data;
> +	char buf[24] = "";
> +	const struct ctl_table tmp = {
> +		.procname	= table->procname,
> +		.data		= buf,
> +		.maxlen		= sizeof(buf),
> +	};
> +	loff_t pos = *ppos;
> +	u64 val;
> +	int ret;
> +
> +	/* on 64-bit, unsigned long is a u64: keep the generic handler */
> +	if (IS_ENABLED(CONFIG_64BIT))
> +		return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
> +
> +	if (!write) {
> +		snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
> +		return proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	}
> +
> +	/* an empty write changes nothing, as with proc_doulongvec_minmax() */
> +	if (!*lenp)
> +		return 0;
> +
> +	/* reject what may not fit in buf, proc_dostring() would truncate it */
> +	if (*lenp >= sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	if (ret)
> +		return ret;
> +
> +	/* a lone "\n" is invalid, a continued write in strict mode is ignored */
> +	if (!buf[0])
> +		return pos ? 0 : -EINVAL;
> +
> +	if (kstrtou64(strim(buf), 0, &val) || val > ioam6_id_wide_max)
> +		return -EINVAL;
> +
> +	WRITE_ONCE(*valp, val);
> +	return 0;
> +}
> +
>   static int proc_rt6_multipath_hash_policy(const struct ctl_table *table, int write,
>   					  void *buffer, size_t *lenp, loff_t *ppos)
>   {
> @@ -210,7 +257,7 @@ static const struct ctl_table ipv6_table_template[] = {
>   		.data		= &init_net.ipv6.sysctl.ioam6_id_wide,
>   		.maxlen		= sizeof(u64),
>   		.mode		= 0644,
> -		.proc_handler	= proc_doulongvec_minmax,
> +		.proc_handler	= proc_ioam6_id_wide,
>   		.extra2		= &ioam6_id_wide_max,
>   	},
>   };

Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
