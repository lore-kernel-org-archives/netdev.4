Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=62.146.106.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795628072;
	b=A+1OQz78y2a5vzSiIsav7jIltkCZkgKYk6OSrJJeKJ299kifZIQX7PQLfQFoKsaHkLVd
	 HNYycolAR3RpVK8AALGJlk9GfyXpCmzLeHN0CaRjloZqV+V6HbLjFgg9p66yg2jxQ+495
	 +y17eu2DxrnQSCfLWCS2SGqPzjtdYVu06dNOFP8s66flKTsAsUIK+jK+PFNSvQm7NelLF
	 SN9chRi4O5qKoCKxo8WSOjQWzEpg5n+1QsJtM6DnAyd3bAHuCGMkQyArGydTaCDspnFq3
	 cXlk2IOWYNn/Vcpbo2iBhDp8m9cc5zg1TUX39pLXbB1kh1HV0/YFHAArvWUyZdYVpHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795628072;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=XGkTRreQRecpokK/FS2LMe6w1H+IZZD4gbNzNgzQEZI=;
	b=Wmsd7hWzxgrM93T5KnmZGVQ1Pv6CwtTWDJbealVChchtvXiCg5Y27TfCYEDJGDnZ0w6x
	 GiUPjpjHKaFPIMQgD4L/9AoqHn59OA4GKzHS+PInRaxJt5SXBX1Nm36D+8FRyiiBjNkQP
	 EghWCf2h/eHuf2qYI5uuHFPm6e8v6A2iqnRc8xFtmwDlIzHhNHxPah+pwSWHaVWf14tqb
	 jfBlRGqWIx9F5o+fMAhWg9xDLOp1cT3rMNKEDbsAMeJe3ux8+E1uRk7Y8CqmFR/P0PvYE
	 k+1+iATaaZut892p0byEiSpkEy3CfgmamxGl/X8ixarNm8reOXExCJvFef101uauHrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dressler.pro;
	spf=pass smtp.mailfrom=dressler.pro;
	dkim=pass header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b=KNZfn5Xi;
	arc=none smtp.remote-ip=62.146.106.33
Received: from smtp02-ext3.udag.de (smtp02-ext3.udag.de [62.146.106.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B51606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B51606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dressler.pro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dressler.pro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dressler.pro header.i=@dressler.pro header.a=rsa-sha256 header.s=uddkim-202310 header.b=KNZfn5Xi
Received: from [192.168.0.40] (unknown [37.228.226.218])
	by smtp02-ext3.udag.de (Postfix) with ESMTPA id DE2EAE0B10;
	Wed, 25 Nov 2026 18:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dressler.pro;
	s=uddkim-202310; t=1795628064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGkTRreQRecpokK/FS2LMe6w1H+IZZD4gbNzNgzQEZI=;
	b=KNZfn5XiKTo75ErEO3k2cOalXWkuU82YQU3/TONhIzKHm5hT47Fcg61IatIfHMRuTP/w8K
	Y48pG2OcjTv9pxR+j0BhNg/2jG1U+ZrQxbg7waOz4slvPBdNOWRRQ+KmO9fzH2onPYB8Iq
	WSfDunQmZ+CT2vkuc9T2Oi3rFfTnWz7kzzwTKbfeMel9DpkKyxkv5ECR2kTvOnBMErMd4s
	8autt7r+4n6dBeyPuD8OhDODtKlHKNlZg/nERvDCG0bt63lL2zFzurwZTDE9xcHMs2QmPL
	oYWJkL6/zGDlV8pcGtyS691yjxlq8El+0rLdhPqkKjeQfYvBX6X8/6KYwzmefg==
Authentication-Results: smtp02-ext3.udag.de;
	auth=pass smtp.auth=dressler-pro-0001 smtp.mailfrom=frank@dressler.pro
Message-ID: <976b81bb-cee8-4c35-9bf3-0cf5d2cec95a@dressler.pro>
Date: Wed, 25 Nov 2026 17:34:23 +0000
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
Subject: Re: [PATCH iproute2] ss: show the process column for -T, -Z, and -z
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org
References: <20261121225031.106742-1-frank@dressler.pro>
 <20261124134134.6a6ac43e@phoenix.local>
Content-Language: en-US
From: Frank Dressler <frank@dressler.pro>
In-Reply-To: <20261124134134.6a6ac43e@phoenix.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 21:41, Stephen Hemminger wrote:
> On Sat, 21 Nov 2026 22:50:31 +0000
> Frank Dressler <frank@dressler.pro> wrote:
> 
>> The process column was disabled unless -p was passed. However,
>> ss with -T, -Z, and -z still collects the information, and the
>> man page requires them to show it without -p.
>>
>> Fixes: 84c45b8acb30 ("Reapply "ss: prevent "Process" column from being printed unless requested"")
>> Signed-off-by: Frank Dressler <frank@dressler.pro>
> 
> The man page is not the source of truth here. Seems to me that adding another
> column without an arg is going to upset some people.

This patch would just ensure that -T alone behaves like -Tp which it did 
until 84c45b8acb/1607bf531f (Dec 2023). It is already using that column, 
it's just not displayed without -p. Because of the man page, people 
might never try `-Tp`. (same for -z and -Z)

Before 84c45b8acb/1607bf531f (2023):
(a) `ss`     displayed an empty Process column (wasting space)
(b) `ss -p`  displayed process info in the Process column
(c) `ss -T`  displayed thread info in the Process column
(d) `ss -pT` same as `ss -T`

The problem was (a) that the Process column was shown even when unused.

After:
(A) `ss`     hides Process column (saves space)
(B) `ss -p`  displays process info in the Process column
(C) `ss -T`  does not display threads (as Process column is hidden)
(D) `ss -pT` displays thread info in the Process column

I think that the author of 1607bf531f only wanted to have (a)->(A) but 
accidentally also caused (c)->(C).

Options I see:
(1) Show the column even without -p. (this patch)
(2) Fix the man page and require -p.
(3) Use a separate place to display this info, similar to -i. (COL_EXT)
