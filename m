Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691902;
	b=1LBBmBecK0M+vbmeCKlbPN66m0yn1GvV6pgM24tHJpTI4XcOSszwGsOkcUkjVRN2FQaV
	 vrQxhi0QGzaNDgsACByawZ56qubR1DI7sdqvEP0izz9smtcfD9MfKtHkWT+TQ6SfO49/M
	 +cWd5xMLNBGNiL9qMQjR1YJ5UtYLP2dP3w6AcnpiU3cu30h8rMOu5/4v/k7WeKJh27II/
	 9eqh0i2XXIdyw1gGbbLqd/65z2RKpupTFxBrEz+XRnVvhZ8l8BLXnXi/zJggeJuc82/og
	 /YYlsZx0feqUt1GqBOiL2iB3AN/O5Cy1QJ/fmXOJKH8ToIeSrtGhOc+ZkpgrD/QX8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691902;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
	b=ZhxEqmE8ELye9F2g/MopwFemSBAi08vXQqIwr8f+Xi0VbMO+tqb7c1Rr7WX7XjAkaQu2
	 6YseiDkHRoi0ljsnCAN+Qg0kTArolAR/VZWRJcfztpV/6M42zfCNb3rnceSevVB8DkmAk
	 Apc4p5GRWZ2iEwrfCzFZh3IK80JoKMxvk0dmMoWX/1ioUIVbkJ6Y1Az6txfh5/9QOcoKG
	 CSq6Llii8eF7or4z7QERmk9K/twE9jcYDR3Md0askBSSN0yefMTsm/7HWP3uz4SR0qKOw
	 AfZzIEwopUKC7BGAAOpj9LicLLyla+Pnkfe6ommYZQcILlcnK7sbveW74gEzlXzH/ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDavmGPX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G7h9QPK8;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD77F606A33E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD77F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EDavmGPX;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=G7h9QPK8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795691900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
	b=EDavmGPXezEkkfs4PaS9T06XbsdhE+dmYog4qocgGCC7OixPX7jaGRq0NG4uUfshUnEJiD
	9zZqI9/C4SpIwhgKykcU3ykLhsQ7YedfVZuHHo4exTdigna8hQNGvK4AZzU7UhRGGikOVx
	WpZgUYpjm1vsE2Q/lK5Td5VSlZeUWJA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-JqaEnnv1NkiTEYJdI8m3Qw-1; Thu, 26 Nov 2026 11:18:18 +0000
X-MC-Unique: JqaEnnv1NkiTEYJdI8m3Qw-1
X-Mimecast-MFC-AGG-ID: JqaEnnv1NkiTEYJdI8m3Qw_1795691897
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso3142722f8f.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795691897; x=1796296697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
        b=G7h9QPK8gnJo7kqPQbu3gaL+m+Ya43nEf6+bWfqo49HZ1dC0DYQbk5dDkyb26fAkI2
         GOzZy2f9tJZhkyEJQushAGtt04Q2LKOar2O60HO6g0RvkF6fBHbzEnz57Lly/ESzWdI6
         WEqiQ1hpvrtvCydSSltsPf3ujtYaOLqp7MUbi2LBFjLKn0UKWacBClbDJpiwZXNWht5X
         YwFx/II7+94pApAre47be29YqhMsUg5vM7citZDeIHYBjC9IuckxRWDKlT4OvevZMZM7
         oL87VAGj4PDOATci7S2OLgX5NBbxF1qMvECSNqpkrgY2mMmoY0PZ0/4tzXoICcoK1st/
         WGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691897; x=1796296697;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kk5+tp69Hm4OtlJWx6xUcvS1bABaPkFBgaohYRUNQY8=;
        b=GfpyU/yuI8rDJmD31INHsfv1i/U2vdzFIYJicToK6aOSAvLdgumLSc9aPVcKjLblzL
         QAi0xh7L5OU9PTE7d50xb+wAyIjXyAJBtILIOdU4oC5//MjsoZCtmWTFdDE7CD5RLjNf
         8MPaaDuzw1dQjn3A9FfTtvhSLRjiLSOzGKEBn/KbnepdnPAbYElWV8w02WlMl6awaSBo
         crJv5q+VudT3i3cRlQAgEtRAlZ+jJWSGVVXirn+ioB7cL6IVYf3naz7BXBBcpafNts8H
         RmwxW3nMIY0vjlT+a6yyYl2Xo2XiYs3MsbD7BqsqqrBW2Vy1seqUJ/vKsQLc68bM9HWO
         AMsg==
X-Forwarded-Encrypted: i=1; AL+hErGJH5J4o2zXitVJPMQlWsPZz40XEH5XyF6QxyHFizwKM4SmqcccrilBrFeRix4phsNt+Wn7RYM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JjyBGadQW2g7RYNDWSjgV1BfC4QXtXqlcBnfnJF0uUH6uwEf7
	6H/5KepoM3r7mxqZTbg93gbu7fe9PX4DG/UNYvJpuAfi4ITPcZgrFZbW5GdtxD+smTTDkf+3kac
	4Upz3nKjqQARu7mTFAVfJxMbxpzIcYi2jTWd3kwR9Dl0d/ommao2Z4FCTHg==
X-Gm-Gg: AZFdTZdeArbvc8PeTaKDum3xD6nwPZeIKt+XUlq0p+Ae+Udnj32yX1ZViJVOC6G/EyV
	3zVyB35B3io+eU74Yjvz4SuOXgK0Uv7gqf0rVfl+Uye8NU1Vpp6hAI0SrUXCiGiQtBJRVsqUWHK
	fI1QMh3six9yxNU6F+N0zV+KOiBbDQ+TFDYmnhGCXRxeimIisW0wFFdKtisxan6H0BtJPrzUNkP
	zkLxUyQ9yxhowE2U9dpmBgTOU5YCi+GLPOvkBqYbwpEEPcC8meJmKnLRcu77+uo3LkZLjRFDrsZ
	dEPc/STEEkP2nRAIEymRqtruF38V+7wxJNla1ggWsPVQvvXQb855AGd2NCfLWZxb8TpsIy61yZj
	eSaJGjPCEW+rUcrPLjGPPid+qUh1cHB8iLm1xBuNkoqztD+P2NU1uKJVAiNbtlR7KtUX4Qnn7Ws
	qclkKJjUWrZoUULO2pqmUj8Gx759qV1sjLHVCxYhLm1Ggd
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr43589548f8f.57.1795691896598;
        Thu, 26 Nov 2026 03:18:16 -0800 (PST)
X-Received: by 2002:a05:6000:4284:b0:4a8:647c:f964 with SMTP id ffacd0b85a97d-4abb6d04d79mr43589476f8f.57.1795691896105;
        Thu, 26 Nov 2026 03:18:16 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm18159816f8f.9.2026.11.26.03.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 03:18:15 -0800 (PST)
Message-ID: <3598861f-f441-46ea-a5c8-574372a34370@redhat.com>
Date: Thu, 26 Nov 2026 12:18:14 +0100
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
Subject: Re: [PATCH net v6 2/5] bnxt_en: check HWRM response if completion
 never arrives
To: michael.chan@broadcom.com, prashant@broadcom.com, horms@kernel.org,
 selvin.xavier@broadcom.com, kalesh-anakkur.purayil@broadcom.com,
 pavan.chebbi@broadcom.com
References: <20261120152830.699712-3-joe@dama.to>
 <179545865940.3135.4199576162321798829@kernel.org>
 <awTBkxA0DV4BiQym@devvm20253.cco0.facebook.com>
Content-Language: en-US
Cc: Joe Damato <joe@dama.to>, netdev-bot+sashiko@kernel.org,
 edumazet@google.com, netdev@vger.kernel.org, edumazet@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 linux-kernel@vger.kernel.org
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awTBkxA0DV4BiQym@devvm20253.cco0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 23:43, Joe Damato wrote:
> On Mon, Nov 23, 2026 at 06:30:59PM +0000, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>>> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
>>> index de02d1baa7514..53667c0c38aaf 100644
>>> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
>>> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt_hwrm.c
>>> @@ -582,11 +582,50 @@ static int __hwrm_send(struct bnxt *bp, struct bnxt_hwrm_ctx *ctx)
>>
>> [ ... ]
>>
>>> +			/* The completion was not delivered, but the firmware
>>> +			 * may still have freed the ring. Check the response
>>> +			 * before giving up and log the state.
>>> +			 */
>>> +			resp_seq_id = READ_ONCE(ctx->resp->seq_id);
>>> +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>>> +			if (len && resp_seq_id == ctx->req->seq_id)
>>> +				valid_byte = READ_ONCE(*((u8 *)ctx->resp + len - 1));
>>> +
>>> +			if (!valid_byte) {
>>> +				hwrm_err(bp, ctx,
>>> +					 "Resp cmpl intr err msg: 0x%x len:%d seq:0x%x/0x%x\n",
>>> +					 req_type, len,
>>> +					 le16_to_cpu(resp_seq_id),
>>> +					 le16_to_cpu(ctx->req->seq_id));
>>> +				goto exit;
>>> +			}
>>> +
>>> +			/* Read the rest of the response after the valid byte */
>>> +			dma_rmb();
>>> +			if (!(ctx->flags & BNXT_HWRM_CTX_SILENT))
>>> +				netdev_warn(bp->dev,
>>> +					    "Resp cmpl intr not delivered, msg: 0x%x completed anyway (len:%d valid:0x%x err:0x%x)\n",
>>> +					    req_type, len, valid_byte,
>>> +					    le16_to_cpu(ctx->resp->error_code));
>>> +		} else {
>>> +			len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>>>   		}
>>> -		len = le16_to_cpu(READ_ONCE(ctx->resp->resp_len));
>>>   		valid = ((u8 *)ctx->resp) + len - 1;
>>
>> [Severity: Medium]
>> Is a set valid byte in ctx->resp enough to show that the ring is safe to
>> free?
>>
>> The commit message calls this case one where "only the notification was
>> lost". But the commit in the Fixes: tag, 74608fc98d28, sent the
>> RING_FREE response to the completion ring so that the completion entry
>> itself would act as the fence:
>>
>>    "The response will be the last entry in the ring and we can free the
>>    ring after getting the response.  This will guarantee no spurious DMA
>>    to freed memory."
>>
>> The response buffer and the HWRM_DONE completion entry are two separate
>> device writes. Once token->state is BNXT_HWRM_COMPLETE, the existing
>> success path reads resp_len without waiting for the valid byte. That
>> suggests the response buffer is written before the completion entry.
>>
>> So a set valid byte may not mean that the HWRM_DONE entry has landed. It
>> also may not mean that the TX/RX completions queued ahead of it on the
>> same ring have landed.
> 
> Agreed. The valid byte shows that the firmware finished HWRM_RING_FREE for
> the TX/RX/AGG ring. It does not show that HWRM_DONE was posted to the
> completion ring.
> 
> Michael, can you confirm that the firmware has stopped DMA for the ring
> (other than completions to the completion ring) by the time it writes
> the RING_FREE response?
> 
> If the response is written before the ring is quiesced, then this patch is
> wrong.
@Pavan, @Michael: there are pending question for you here and elsewhere
in this series, please have a look.

If nobody answer in a few days we will have to toss the series.

@Joe: could the issues be caused by a broken firmware? in such a case
nothing would stop it from doing DMA at the bad time, right?

/P

