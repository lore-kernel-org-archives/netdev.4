Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441835;
	b=0YaerpSgjaa8MdyCaNYiXcPbetSTi7gl4O9Pfk77hQj0Tozw/R6Qj+FPvvO0vQp0DT6W
	 cKtlg+euKB+f7WaE65xR68meEWpUqMU20oKbKp09GxMYvjohT2UU6fx2OLYbrC92yqFxi
	 m0ntzkD0fNHBANR+llx/5m4ntJzur/fllHW6DTr8THmLVxyRvMKDN4lPp87AjDjIUcb6l
	 +XMSNpl0LvGTjG+LGnOn/XzBVRiwZDVFMT4ySOY4UmgvY7c77mnioUw2qEWW8gjLRm5wF
	 tjU3Pb5xMI22iOMsbIlcZG18G069uElpJY+NmRDqgRLflzCraSOQuAwn4aH3Y0HCTmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
	b=QY0WB22bStP+c2SKghA9WVO24KauSYpACtLR7XnXyffJcryM2+9Z1T7vFMRDmpasYyCn
	 uJjhzeVdjhkHjVP7byAAVQ0hXC4kilTNrvP+jaSAwKJ0wyn18aeoasoM+G8CavaTGdLuX
	 ob+5H1AF7gR0GCaksFmG32fOTCc665sok7n69Knarj4HdovtW86NBmujprV0GXIBH1qKR
	 u/c1FFhuOCSrtLEUbjTcSpCaVs5WgbUs/29rTsqMWxAwdrYsIlVjdvAZLuB7S47yPrAi8
	 bbhxOrFVVqRl6EP8Wuqm8WK5xPaJz6v/EAR7Xk5obPbMMsDYG1VRJ5qtu2dI5LZIRIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPTrwrK6;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0B4606A33C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0B4606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xPTrwrK6
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d28f75d62so552360766b.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795441833; x=1796046633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
        b=xPTrwrK6fyazwXD6N9sRU8vdj+qov9rx8UD6+1pucPMFc5mHpXv8lKESKi6C1mJzb4
         ycZ0zXWRChTZshQJ1cbaXYqZxsUo+LicJygjVF6eM2kbd016s8ZjUmU5LhPu8ZHJq1/r
         mZITZKW8W8oqzTlBdGfiEdd879Oz7h7WFSwj6IJ3nDSMGug2qNM0tCumlY6DjLCn3x0k
         aL/YIk/W45HiPuAAufNWVdjLBv+ZIx7MEX/X2T9iJMK8YgdjYrMAcqTUeGjBu0gFBUL6
         R2kjwhNz6ET0I2cUVomvCJJ4zc8TukAuit9/P75HyzSPZr9nNU+WZQWamUxseIdC6wvd
         sx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441833; x=1796046633;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bane91NP8+Gml15ubrXTKh3benjzD/ALRcScJf35bXw=;
        b=J/mpf1M033M7HR+tJIatkqrDLQfUamvu7OWp2EMz8g1BKXiZlo0jzf4Q0sW+8kt0gD
         hCfe9uay/cP5aivl1/prDzR4c1C+LPFjtvLgIUPFXV5RNdWm3KAoH4UGV52gUeenifPF
         SPJ7qS8Tvxiq6Cfldk4d2BKpsvTgh4dhfKKlJGQ+yf4NYOnoetJXV2XNvy/kBt9wHHwK
         GbR3I84+jihqdKVebQ7QuZJCuzSEjZTIDjmYMZuascnsxRQWbQp4WgbBi14uul1Koa6D
         /1GYb+T7Nz0hvkFbZjtcF7zcvq2U4t3ypLxMqfxzHQ/fvTrq+fP0m59suWzAmCebKYvC
         7RUA==
X-Forwarded-Encrypted: i=1; AL+hErEuBq3ZPpnrlMCIrW7rIJb9vEY2MUh53AwYLQsUt2hfMIrlWCHRz138thXy6qLPfsClffcVUs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qfDCDv5Dtol0OO4p1F3nNaIKuKjbn3oFDG3XrTaM1xdSrq/N+
	BOT4XK3pDfvyo5N7qIN58VF48RZHiMNRLGWurCIvaiT95TMO0ojYyHLFGp8yfw==
X-Gm-Gg: AZFdTZejlNz5IgszYV3K/H9M6j34nPA31jLa8OWKMJ/gKhxlLkJoCmpEcD5v/vsHU3K
	g6lhFFJuowJy4igXiASuneSP61oPEddDAD7R+Gyx21MwEqknAYlgZWEXBlx7s80JKuyUezyfh7D
	yyF8VSyhCM+Cul+KWplY48hk9wKeLlPhcrRucnN4pMNYvdN2r5XlOvNUvCMQMEyScgDl9efoMS8
	BqRayv9MJBIJLmzCD4BrEmSdGOexotSXn6Q4S4qyLoEL1yFGhQqwDL5j1gf/cd9DAJay2K1Xc+b
	dr3rPwPf7Xlx/wrD4pHYTtVpDMnvGS2nsYlhqVuoLD4GlSGCC7P2sxCS/CmhKBZ4LsjktwmGcc6
	283HykwppdyPpx1/dVjXlfVkjRqvQ2sDmzKR83EZz5vEg+Pdyr7CO10o2NC9ccZLs33/63P6AuE
	dZgqeSudD+YhTxb1OnmA1YAA9GbkaHEmps6Bjgn6SS90j4AbeBfbNy8A40u5VD67lhj+iOfK0Xh
	nimIkLtrt8rUYrOHk7mNY1U+LlLjMrSMvn0chKgtA7nG87+IUmGM5gI0xieW8NYOJJ+CJnamQfc
	8SKpwzDWobJcdtHVxHV4lNx14YkxjMC7ZTSE08sA8ca9Wq3ybGzWxj/I4i6fRrIpoMFEmHkbAVY
	zbs3x0L6y62BTpmtAFEAKDRsHwLj053MN50lzgEsdQSqEXZqiliyYuMsibC0rIiWpEg0K6rqAzX
	UDb8o=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr612886766b.26.1795441833283;
        Mon, 23 Nov 2026 05:50:33 -0800 (PST)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm410984766b.8.2026.11.23.05.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:50:32 -0800 (PST)
Message-ID: <c60f3a12-4a54-43ec-b1e4-45bf43deff57@gmail.com>
Date: Mon, 23 Nov 2026 13:50:08 +0000
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
Subject: Re: io_uring/zcrx: copy statistics lose updates when one ifq is
 shared by multiple rings (Data race)
To: =?UTF-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <375d4b.2ad09.1a202324f3e.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/22/26 07:39, 徐晗翔 wrote:
> An io_uring zero-copy RX ifq can be exported by one ring and imported by
> another.  Both rings then perform receive-zc on their own TCP sockets,
> but they share the same struct io_zcrx_ifq and therefore the same
> ifq->notif_stats.  The statistics update is not atomic:
> 
>      static void zcrx_stat_add(__u64 *p, s64 v)
>      {
>          WRITE_ONCE(*p, READ_ONCE(*p) + v);
>      }
> 
> io_uring/zcrx.c:1337-1340.  It is called for copy_count and copy_bytes
> from io_zcrx_copy_frag() at zcrx.c:1770-1771.  There is no ifq-level
> lock in this path.  lock_sock() in io_zcrx_tcp_recvmsg() is per TCP
> socket, the ring's uring_lock is per ring, alloc_lock only protects
> fallback niov allocation and is released before the copy, and
> ctx_lock/notification is taken after the statistics update and is not
> involved when event_desc.type_mask == 0.  Two CPUs can therefore read
> the same old value, add their own increments, and write back the same
> new value: one update is lost.
> 
> The effect is limited to the UAPI cumulative copy statistics
> (struct zcrx_stats at include/uapi/linux/io_uring/zcrx.h:83-86).  The
> values are user-mappable diagnostic data; the race does not control
> buffer lifetime, DMA, reference counts, or packet contents.
It is racy, and IIRC Clement dropped atomicity at some point, perhaps
for performance reasons. I don't think it really matters though, the
main purposes of the stat is to be a flag saying "something is wrong,
setup steering rules". What's your use case? For precise statistics
I'd rather prefer to add a trace point, which would be able to do it
the right way (e.g. per-cpu counters).

-- 
Pavel Begunkov

