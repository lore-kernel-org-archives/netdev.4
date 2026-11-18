Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966983;
	b=QPaOce3hmAfU/MMSeIpUTNVJhteocVDpAAexsRD55UhBZketRjtzTX4p9xBTpq14gQVr
	 7ycta0tWgx097Ll6zUSgGDBIbNOaI0jX58h8T9ZEL2vLLcfQ14xEMIM4MJ+y9xdrqQDRu
	 UtDBno+bdwkn1GIyFRIY/V74Yodgw+xOnkSdLtV0KGlDujB7gyswtj5W5IK9y6rcmUPkW
	 kNZNr7fX09Ce1lrEQzPgzsgh2XIQavJFtLvreSRvJ4nZw+17rmxRkbLacoM1HRWfCZoP6
	 gTMflpFbwCGPIdtRTmxpYLEzeROrhtfngxJcnd9D4SpwQG22WP7hXt0XLExR04EF1Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966983;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PEzaiXe/BwYn0wyikcZkU7jHpGSWF5KdLHubwn3Rz8c=;
	b=R3AIctAk5v7ozKTi/sIi6U+FRmU9vq1SqX+qhR+T0hm95yCu90Afi6PO8ADVdFi5O4XU
	 C9JssOIYmekCOvU+6bQdtfdPFk5Scagg16FTfz4uaoq0frOcRZ4o/uJKvYcdzOeGVX2yC
	 Q8mSN0k0FfWgAu7ReZTQ6HzIubutiNNzJa+lsL3jY3LOFHor6eGfRhMXKCBRccjwfyQ8g
	 aSEdLtqU2Vvhz/eUp8d9AHJlTVoyVYLhmIYEtCsGn0QDzq2bo1/6QKlHsOYTNT3Oe527t
	 o2fIs4x8GefGE3l7t5gojbQXJaNoad7jS0YYmYOXUgmDe4egejDp8dqv9pwUBh+spaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AhnYnySQ;
	arc=none smtp.remote-ip=91.218.175.174
Received: from mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADF2606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 01:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADF2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AhnYnySQ
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=y6rqbLvaakw1Vs5JNP6HAQoycmzxKnGquwpiedhS5iA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794966980; v=1; x=1795571780;
 b=AhnYnySQ6tUFNJ3PkI6Es8pbQLBG8k6x1K0CgfXAa7DCtjemZa9SlcoqKGfd2VhyfZgrNrz9
 xg1FHkn7Sxaf6VTj8QKcdfoJExKkY4HhrCjWfhCftVUq+olB8O8VIjHEaYouW3goiI8LErL8tWt
 eE3YTVH3o6GOmimIKExzSIc8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e19851a3f875c143;
	Wed, 18 Nov 2026 01:56:20 +0000
X-Mizu-Trace-ID: e19851a3f875c143
X-Migadu-Flow: FLOW_OUT
Message-ID: <ff9a041f-27fa-425c-b2fa-4cb6a79670d3@linux.dev>
Date: Wed, 18 Nov 2026 09:56:14 +0800
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
Subject: Re: [PATCH bpf-next v2 2/9] bpf: Add log support for tracing_multi
 link_create
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 KP Singh <kpsingh@kernel.org>, Matt Bobrowski <matt@bobrowski.net>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20261114150610.84507-1-leon.hwang@linux.dev>
 <20261114150610.84507-3-leon.hwang@linux.dev>
 <DMX8HR7NDP9V.CDDWGLZ98C0K@gmail.com>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <DMX8HR7NDP9V.CDDWGLZ98C0K@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/26 13:24, Alexei Starovoitov wrote:
> On Sat, Nov 14, 2026 at 07:06 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>> -	if (!cnt || !uids)
>> +	if (!cnt) {
>> +		bpf_log(log, "tracing_multi.cnt cannot be zero.\n");
>>  		return -EINVAL;
> 
> The user sees cnt == 0 in his own code.
> He can't see which of up to 1 << 20 ids the kernel refuses.
> That part stays silent:
> 
>   bpf_tracing_multi_attach()
>     check_dup_ids()                      -EINVAL
>     bpf_trampoline_multi_attach()
>       bpf_check_attach_btf_id_multi()    -EINVAL, -ENOENT, -EOPNOTSUPP
>         btf_attach_func_proto(NULL, btf, btf_id)
>         btf_distill_func_proto(NULL, btf, t, tname, &tgt_info->fmodel)
> 
> The last two have messages. They get NULL.
> That loop runs before trampoline_lock_all(), so bpf_log() is fine there.
> can we pass the log down and name the id ?
> 
>> +	if (cnt > MAX_TRACING_MULTI_CNT) {
>> +		bpf_log(log, "tracing_multi.cnt is too large.\n");
>>  		return -E2BIG;
> 
> that's not a helpful message. -E2BIG says the same.
> 
>> +	if (attr->link_create.flags) {
>> +		bpf_log(log, "Invalid flags.\n");
>>  		return -EINVAL;
> 
> Each value but zero is refused. "flags must be zero." would make it clear.
> 
>> -int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
>> +int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr,
>> +			     struct bpf_verifier_log *log)
>>  {
>>  	return -EOPNOTSUPP;
> 
> The stub has the log now and knows the reason.
> 
> Consider something like:

Ack. Will do.

Thanks,
Leon

> [...]

