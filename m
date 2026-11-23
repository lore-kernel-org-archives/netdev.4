Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443043;
	b=NVDZaRcPzyAz0QYgk/HqegJodyZ59ltYRroKEd4PqEKQnU/+j6NCOg8BhHkXDSGNJl11
	 YI/P4PIf0MThDtdIecjgUp68im6AWDplFBQ9eyMOAxxSRJGAl9cl+q80AuRbqETdiQley
	 50cSQRi1NbLd/WaIBI6oEfzxj+JFG8tFJCqiHeApTpxuF/PXYDaBrPqDjOcEfA1vuGksi
	 7jBR1yJuQa64cmIYW+x6ZAJzg5V23UZOolAwL4zc+Dhc0hrKXFPD4eCE2vCGiPUtYDm0R
	 rmVxa15dMHjL+ICIsKmQbxQIRA/YNyeCo+mkAN4rpjdvuxrHAtmGbeMZnpp5BCOuIxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443043;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
	b=hnW4COqvTatxgG+r9HmpNeYAQexhjzv6w+5I5ymO1BKvo4n1w9aeGlZqeJJlh1sxkMfW
	 vNsVKCuGFQcFH4+NV2Cs3WWLYBxMbC7tvXO6Cb2uR+Xn81tVrosriZAsnYH36IIubZV+g
	 3LwYiVKnc4pQE5LQTWetRWEw09yC0lDjwi8ryusEx4jxf/eKioHJDDzwRpudwiIOY5V6Q
	 ByanQT/UOcoAq3CyhSsnK92OBa0zHWNt3AufkmDG0Qa14TIhmWjmEb9sgqbtEQHt6wTNe
	 pdHSc/gbfGq6fc0/eQc+vrOjLAcqDClzQ7UYOb9zLllGMR9zOxxDJobDx1NbTqN5y2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UOAZzI6f;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HS8Zw2vZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9EF606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9EF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UOAZzI6f;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=HS8Zw2vZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795443041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
	b=UOAZzI6f4ouMYpqmsR9B6iczkGyCAOKoXOgRN0PkUcFFK6VY0Zkf5epR42NhSFdljcZ0NS
	sq/fjR4LzGVZspphQS6Uayx/MDoHNk16mriAvviAnwAeuw/xzH67mc9Q8g8JhmJ1YNHehY
	nvLfKdvTk9PVgXrPD8k5t5BD2SUEo8k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-LRS4CWQxNOCTpYyUxba9Gg-1; Mon, 23 Nov 2026 14:10:38 +0000
X-MC-Unique: LRS4CWQxNOCTpYyUxba9Gg-1
X-Mimecast-MFC-AGG-ID: LRS4CWQxNOCTpYyUxba9Gg_1795443037
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso1902048f8f.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795443037; x=1796047837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
        b=HS8Zw2vZXfRc5pFzephO2HuWpukeODdUPJWODFDzfTzL1EPdjohlBLWUS0rNDp2W3a
         nRjseF5wUM4SA6L6JJlbCMTT73Iff6mg37WzyFIFM2I7IS8FBJQm0QWv2nTFK69oAnzv
         nqF2dULsnlZHybk80icp6Ocle6YhYwvm5sgptB0Dm+2piFGDF0eAi3FMZHvsrj2IEQIq
         TDssYGhFKvPZpQTr6Co9sbqGe0pY7mQPqFGmC2Mx7y2nqSLPs2e5lVG2UKbP+6tXCboq
         usbJX5nI7eSUpDMWD5gEA+5UililtpM2WQ6H+VhOZ7UwzCkVvZJZeUMcvHkB3c9i6I7E
         vjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443037; x=1796047837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1AIvaF+IpG23jdKP21kq1wT2/x6/exBEcH0NfLvcbg=;
        b=yRB8KANUTKSJB0xzZai8FUyMmZhHALveyEeh0VU3Sido6nEAiuXYjyHwwjU3P4g6gi
         dQqlMm9plD/aWchesE6H7kfx5FqQf9EjKb7YeYGfs9LHeXw2DqEgzP/3udo2SALKRx9+
         8LKHiyo92+xB18TMGQ0s7Aaneh27hoKlyD+CG8oQ/JlpJagfwhkziF72UeuDV0PTPBiY
         txUCp+0/bhvEM5yAVqxq2skd6fXm/mTW2Vy+D7Wfdk1xWB8NesZPYTI6yy/E6Pwk58JW
         sevcwAnHgmZNSVWEMTSqrhsoYq94I44TNpSWPRxysGTOB8CoCWa3q5RrgW5cbJZXaz1L
         X2jw==
X-Forwarded-Encrypted: i=1; AL+hErE99SMSPLUFy85izDprL8t3TBZ0i2qFuhXJ8k3rY0tgJHcXlrhBfpLRQhRVZgBqlDu4PfMTIi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/R3f8bnQuTu0UDFWVPIA8aF1ldN1mr25MIG4ttOPkEpXzgGpH4
	2+DHNPd+Pyi4OBksvbQ+RjptWI+Af1OAAPkLUcPBp74GeFw7qAzSKo4GIL+6JGUCGqk7VQtyFxp
	qZl9uZWdWn0bAmewPQaOROxYPwQWOHINH+RPlwSz9YwDE7a46P9G4EoEuYA==
X-Gm-Gg: AZFdTZft0bMForVl6HdSRTnXT2YgX3Mx00Aj/oaAoubMmGb+CE5Yb2qIbvUpEncesyE
	EtdTpT7WJecBSUVrEX8fmr9P7hEsQ3UKLwsRcaBEQfZiBD9Fv1VNwrviTqukjT3y9Y1MxBa4+P/
	3Q+Vn/HqOFRaIPqYVk+ne0OyLPI6qI604dSznPlNVOSkOheqgw7i981P/7VZ6zzF7iDt7cnfoOI
	m6iHUPrVtInYGgIc/QY2DXI9QMYipCO6zoxD6+eiN2JxiYkQ1jBoLEkeSrJjrmEyzEN5wt3A3Nf
	YqY9bP2vDPPxL4VpEsN4GLPJMsW58wh3pGljwBUFwgAisnRebZ+Es1owa6um/e4gnT0eIS50m8n
	fumHi23LtZ8qPwm+DUt1lhYZPZ3v/n4XvKhnRRrw19UxmOjSmU7arjS44aZLdoDA1lOHk93tgDE
	wcL/RduY1BA4Oo1asugbgs9D+pFgQ3Tdl1yHYHkpQqEYtk
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr257260745e9.0.1795443037467;
        Mon, 23 Nov 2026 06:10:37 -0800 (PST)
X-Received: by 2002:a05:600c:828e:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb8878702emr257260265e9.0.1795443037023;
        Mon, 23 Nov 2026 06:10:37 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm23666814f8f.57.2026.11.23.06.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:10:36 -0800 (PST)
Message-ID: <2f7e6a9d-1d8a-4d8f-985c-b25149c62072@redhat.com>
Date: Mon, 23 Nov 2026 15:10:35 +0100
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
Subject: Re: [PATCH net] ppp: serialize channel connect with unregister
To: netdev-bot+sashiko@kernel.org, 26031212468@stu.xidian.edu.cn
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com,
 qingfang.deng@linux.dev, 25031212117@stu.xidian.edu.cn, byu@xidian.edu.cn
References: <20261116122750.23294-1-26031212468@stu.xidian.edu.cn>
 <179505889320.3136.16828129332871650938@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179505889320.3136.16828129332871650938@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/26 04:28, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 (1) · Medium: 0 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] ppp: race between PPPIOCDISCONN and ppp_unregister_channel()

While the above is arguably pre-existing, I think it should be addressed
in the same patch.

/P

