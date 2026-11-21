Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270468;
	b=R0vin2XZ8RVIW4wMbojbDotXrAtxhRr8ZcLWoya5EVwjxDe6AC3a9yBr1A25nUpDIFIj
	 0KzrHu7qf95t8c9NybXNqQ4gbZp3x6fHpx8j8EaopEo9FGt1bOn00FS1FDT7iR1xHKfw3
	 tb3Sm81lDsk9sDNtHETBuaNA78ZYW+F7SIpBQbJdrZbxCtzHsX06Qeyl/QdyLLtzPBJMz
	 +gmfA4Sxchofh0q1bjMkHLSAaLBP34arkDTvKupB+h3Awkc+kw+pCyIJ1FFVKfO979cSh
	 Hp6nEwjx87fN7BqqqeGjWcGocwsO1XjGG1jYmMp0Bj31abbI9Q4ZCkYwWGKhtqrsK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=0rD0qrd+dhCoLB0IIDp8JdT6Z9kjllGZPoZgWfwBLLA=;
	b=aRXYHLMRO1JYGPzVWWgY+M9UefZJbzTQSqFvaKgEjrsQfqm4HSAqLUNerT7cHknVjeVD
	 h/rBc5BoRLf+PQYuK80vOdj5bVSUg65V8QfxwAgV9TmFFUcImYKfeSPiWl57M5JNlK1fF
	 vwXyQJH6K2GkDaigdXaal3veYxs7X3wCvk1G8ZxHV+n6pVbmVyXNzgVWwRQy2ixwbwMYo
	 vk7XFL9lfxfHf/K9MANytUMc/5fRB1PyyjuKEcH7dvJraYemoCg9iD5WWGh7VomantCcN
	 FvkUW0Y8kSpzB1P7WO7XXQ0z5lfLn3fy2h8OVstkUpVFrsTv+lHkZEHxEuWUvTZEfgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzzTyVDr;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3E3606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C3E3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzzTyVDr
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4cdc606b47so328213666b.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 06:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795270465; x=1795875265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rD0qrd+dhCoLB0IIDp8JdT6Z9kjllGZPoZgWfwBLLA=;
        b=PzzTyVDriiN+HvGRxS7X6sD9LGrnUU8hbM4kSKjRxAZUGbx4mIclczlBrG9vN2MH0Z
         ZOv85TMKPJrzu1ya89b/hqdJ3cfSD50+hNCY/gvXdRirEdeAbTE0m3c3IGRU2bEERS9m
         hWJg3BnQ2x+eMJcDtGfNid8M/41PKwJ5LP2En8bZAi8yE7Cpi8Y/pCymFsrxAMDDUcr1
         D64EKioRbb0X6QZwsh1okQcoRZGu7kAUR1+xck/EJlvtsMTnwvXBPSXWIUsnJkSpXL6R
         Br+pxmWSSH6E2uoYz5hhCt4SAOm28UY60EPzRfhlCjoPYRVhCl5FMe+O6E1OB4OPYdVF
         URwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270465; x=1795875265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rD0qrd+dhCoLB0IIDp8JdT6Z9kjllGZPoZgWfwBLLA=;
        b=ww78Kv+BGvMyzD622ZK0upT3kNh264gqbIwfkTZ+JNTutcMz+FkFA77MY2tqYs7Lu2
         99xbfsW2EBwxCvN7sZllwgsZrMaoEzLX+x7vAvXxP+vBOBFgs7Zl0ZC69zBqUBpxvoID
         Dw4xuDW9cKkJGTJbiqj8eWd8aDjzj4DLNnJKpBZLK8viQPNKYq5k3JPTSO9mlfE/L8rl
         MNNPl4vju/dINq/KgRZUxmJFyPEOj/fnmAlpwaEo0LhBOe8gHK8jpgzVbdo44z5Aw2XT
         eUbYrg/QFlaJT1syueWSH/jV+UOuY4/8jXyD5991GZ3d4aOeZJbu3TW9s0/Q50pNF5wV
         JYMg==
X-Forwarded-Encrypted: i=1; AL+hErFDn6xBzSsAEQTDLJ/uE1VU8pUlkRtC3Vi1fgnb3/BCUdZNotbfTle9Pxn7TTRuPhQ6uLzcsTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ophf/3rBPDdT2jMGSqPtH3PUPsRIb5m6b5pHwfTZqswE60/rA
	O57rQSLQ+A2aIxLHi0c2j5ibvV3QoTEBkYIiiIZbGTO4V8fd5AQEXk3E
X-Gm-Gg: AZFdTZeX/7hnBXQIYmFVtcaUll4jw2agwXDYXI2ja1kxbTO7XjnSqv1pDtWYo3iScgE
	C4+ElmL1lQddCLds8NV61q4eCKKAm9UGmVf04Mpp61G/fwsB7Wvs3TD3/yqCRW73LQEUmMEF83d
	wRxwuS2Hiacwt3JHvxCcTQXx+nml5Jeh5KtgjaM5kkiNYRFB87V6NxpAZpf4gM6TWVhKEEkIFR5
	IK/pyBKAe4zI1LBT3ab+JrMmtgSlXO+lLoij+SSXhOUTEC791FwX4LMr5i7loazvZe9dhlT/TdA
	OY8uTjFfGqrAVq6VnmbTSSB6XOMtkFX3DZu7MXOzDbAnZydboh/6KZiJ7zfgEsSpzAXWnZ8kPmx
	ONU9Eqzo4DucXdoRpbHAIyn5hn+ycappEFuaXIUIKJAlQQMJ6117XgZUbcc3iIX8pNSNbpewan4
	Hukc2iYsrnRdNjU8zz7SQ+ez9WLPNdS24lg1kAzFP2y5nHUiHYA/HyGev857rROaW9gEr8C1FVS
	yISdC+1qXAcC27agjLsvcnbtczq5rZryg/fr6Y7YLF/DYxJZV8WmmbhjO12Tp7Fa+7fMfnu19BR
	7Hqe0hBrGPjhKRYNX25mGKsynvNa28aOcXHEixoTUkFtcK4Ra4d37T1JWgnwTGzFeKc6iTPqibw
	aLPoVfgSEg1NdYcFaErMtdXV+xDca
X-Received: by 2002:a17:907:3cb:b0:c51:40e:847c with SMTP id a640c23a62f3a-c513a84ab4emr344789866b.23.1795270465486;
        Sat, 21 Nov 2026 06:14:25 -0800 (PST)
Received: from ?IPV6:2a02:a03f:a75e:9a00:3fc0:359d:ccea:ff00? ([2a02:a03f:a75e:9a00:3fc0:359d:ccea:ff00])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad00232sm210570166b.12.2026.11.21.06.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 06:14:25 -0800 (PST)
Message-ID: <78ea7e1d-b6fe-46ee-8dda-1fe6655bbf31@gmail.com>
Date: Sat, 21 Nov 2026 15:14:24 +0100
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
Subject: Re: [PATCH net] ipv6: fix ioam6_id_wide sysctl on 32-bit
 architectures
To: Shashank Mohan Jain <jain.sm@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118042958.83243-1-jain.sm@gmail.com>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20261118042958.83243-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 05:29, Shashank Mohan Jain wrote:
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
> There is no u64 variant of proc_doulongvec_minmax(), so use a small
> local handler that goes through proc_dostring() and kstrtou64(). A
> generic u64 helper in kernel/sysctl.c would be a larger change for net
> and stable; it can follow separately. For normal input the handler
> behaves as the 64-bit one does today: base 0 parsing (decimal, hex or
> octal), surrounding white space is accepted, and values above
> IOAM6_DEFAULT_ID_WIDE return -EINVAL. Input too long for the 24-byte
> buffer is rejected rather than truncated by proc_dostring().
> 
> Found by reading the code with LLM assistance. Tested on i386 and x86_64
> under QEMU: on i386 the sysctl now reads and writes a single 64-bit
> value, and on x86_64 reads, writes and range checks behave as before.
> 
> Fixes: 9ee11f0fff20 ("ipv6: ioam: Data plane support for Pre-allocated Trace")
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5).
> 
> Based on net.git main 2a324a58a084. Built for x86_64, i386 and 32-bit
> powerpc (pmac32_defconfig); W=1 shows no warnings for
> sysctl_net_ipv6.c before or after.
> 
> Runtime tested on i386 and x86_64 under QEMU (TCG), with a small static
> test program as init: default read, echo 5, the maximum, max + 1,
> values above U64_MAX, -1, non-numeric, hex, white space, over-long
> input, two-part writes with sysctl_writes_strict 1 and 0, and a new
> netns. Before this change i386 read "4294967295 16777215", and after
> "echo 5" it read "5 16777215". With it, i386 gives the same results as
> x86_64. On x86_64 two corner cases change: a write of only "\n" is now
> a no-op instead of -EINVAL, and a number with 21 to 23 digits (only
> possible with leading zeros) is now accepted.
> 
> I did not add Cc: stable; please add it if you think it fits.
> 
>   net/ipv6/sysctl_net_ipv6.c | 36 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
> index 1a0a36dcd..7bac56b9c 100644
> --- a/net/ipv6/sysctl_net_ipv6.c
> +++ b/net/ipv6/sysctl_net_ipv6.c
> @@ -30,6 +30,39 @@ static u32 rt6_multipath_hash_fields_all_mask =
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
> +		.data	= buf,
> +		.maxlen	= sizeof(buf),
> +	};
> +	u64 val;
> +	int ret;
> +
> +	if (!write) {
> +		snprintf(buf, sizeof(buf), "%llu", READ_ONCE(*valp));
> +		return proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	}
> +
> +	/* proc_dostring() would silently truncate a longer input */
> +	if (*lenp >= sizeof(buf))
> +		return -EINVAL;
> +
> +	ret = proc_dostring(&tmp, write, buffer, lenp, ppos);
> +	if (ret || !buf[0])
> +		return ret;
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
> @@ -210,8 +243,7 @@ static const struct ctl_table ipv6_table_template[] = {
>   		.data		= &init_net.ipv6.sysctl.ioam6_id_wide,
>   		.maxlen		= sizeof(u64),
>   		.mode		= 0644,
> -		.proc_handler	= proc_doulongvec_minmax,
> -		.extra2		= &ioam6_id_wide_max,
> +		.proc_handler	= proc_ioam6_id_wide,
>   	},
>   };
>   

Thanks for this patch. I agree that a generic u64 helper could wait for 
net-next. Please keep -EINVAL for a lone "\n", as before. For example, 
not tested, save *ppos and return pos ? 0 : -EINVAL when buf is empty, 
so that strict-mode continued writes are still ignored. Also worth a 
line in the changelog: on 64-bit, "5 6" (for example) is now rejected 
with -EINVAL (which is good) instead of being a partial write that sets 
"5" (which was bad).

For v2: make sure the above is addressed and all maintainers are CC'ed 
(Joel Granados is missing). Please also fix your Assisted-by tag.

pw-bot: cr
