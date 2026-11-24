Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.67
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795501566;
	b=RKVbDC7VbSQ1NBpPecqgig5bFcBpKaV2EtubC+dI8SXZqz2SE61jFveOy+tmOzwd+D/L
	 EK1+zPE0QBYtUGn9M3sT46RBuVpkL1xf7BBKl+aXN1L+MacQ0EqsIT8m70+OSRhIFKjjC
	 WEEMWnSsvSNNHN/anV904/DTJ3gsJNZ5Pb7cuFIZHDP+Lel0KFDN/91hn4jK1zIjJpyRI
	 eJPZodi9ZmbUTOedYW0d8RKZbtCKRAQYlEpkIgH2pFECfDX5T/rKdHEk90XD4Z55c3Rd8
	 M3e6wfR9qD2LolYI8RXAmkbcLbIPONMSStbsDauMbceA0sx0MAT1nOl3ucs+x3wlJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501566;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=449gIxytb/HnDdGvFu4T1xW9ukKcixFJk9Iaz+yC4MQ=;
	b=iuKARFtPNwjxulRWTzJNg7uMPeGm251W7MQVgcm2AnKPtTml/QERGxjIHFsQj3oOgiII
	 pH+4rwc3+ivxw+CUAXAPS1luEQ/x7AjhfniqBCluYrXate0OEDimSQsyQ4mrurhvIgpIY
	 VA4gRLW02DeZaBz5tGB+mDtW29jD9nFEBsJIFThYRHIumhrz9DaAtePALs4DCSPcRYdH6
	 xK9BpAhp+NlI5c4CS6um24bBMGkQmWtJlkTplIGKphNdWMkOfpP9SuIHusqrjxGcSfnMd
	 EY33waMlCh8IM9dLeGTEGcnRUnjsKqDprLt0IeWadv3Pea3UFy7EGQOYiZI2z06Cu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YiY8PMaG;
	arc=none smtp.remote-ip=91.218.175.67
Received: from mta0.migadu.com (out-67.mta0.migadu.com [91.218.175.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2BE606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F2BE606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YiY8PMaG
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0ckwT1MNxjCaUKr8B7kPL7bLosNZahWjCYvLItqr8CY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795501563; v=1; x=1796106363;
 b=YiY8PMaG7++Ddb0Ee2gLc0tCXOFupKJxrViHjNQbiRerL32gCCK0orcnLxhnkdUoWQYpYPmL
 pDEfSSDR3HxImIkpEDnvf+EdMTBhZ5JKmamM7HZJu3BQ7MyZ2W7zbVivpP4dRLlapGntm64aAEB
 HUGqCcDo6Ju8dFKibQwo1gvc=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 588e070f590522ee;
	Tue, 24 Nov 2026 06:26:03 +0000
X-Mizu-Trace-ID: 588e070f590522ee
X-Migadu-Flow: FLOW_OUT
Message-ID: <2d330be7-3d8a-40e7-a5f5-3a24c7e434e3@linux.dev>
Date: Tue, 24 Nov 2026 14:25:54 +0800
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
Subject: Re: [PATCH bpf-next v3 0/9] bpf: Add log support for tracing
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
References: <20261123152743.19629-1-leon.hwang@linux.dev>
 <DN308UHY5QHQ.8CJOFGAHVVTR@gmail.com>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <DN308UHY5QHQ.8CJOFGAHVVTR@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/26 08:12, Alexei Starovoitov wrote:
> On Mon, Nov 23, 2026 at 07:27 AM Leon Hwang <leon.hwang@linux.dev> wrote:
>>  .../selftests/bpf/prog_tests/cgroup_link.c    | 324 ++++++++
>>  .../selftests/bpf/prog_tests/iter_link.c      | 156 ++++
>>  .../selftests/bpf/prog_tests/tracing_link.c   | 741 ++++++++++++++++++
>>  .../selftests/bpf/progs/tracing_link_ctx.c    |  17 +
>>  .../selftests/bpf/progs/tracing_link_multi.c  |  36 +
>>  .../selftests/bpf/test_kmods/bpf_testmod.c    |   5 +
> 
> 1279 lines of selftests for log messages ?
> This is way too much.
> 
> pw-bot: cr
> 
> One row per attach path is enough. It checks that the log gets there.
> The base kernel leaves the log empty, so all four rows fail on it.
> Something like this:

Okay, will update the selftests like this.

Thanks,
Leon

> [...]
