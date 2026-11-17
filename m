Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953481;
	b=qG6j0n2VkbZBhzAbn4gGw142Dd7NC9n5k5CnJkfS45tLxNiIwuwwhq8HM+UBtJVTuqzg
	 zDS0l8iq7KjvuukjVWzNbmlzbQSHq+267bp+ReFLXCxgrmq3E1EJWr3GTMHVytOdMfzHy
	 x8/g44Jq6KjRP7IYZugOn8wNenQGQwk16qzlJNeovmd2ExJV2V8kBHBvmiBS77WmG117E
	 76xpmowH9pePf4LSF+2vuWZvjLYu/m0yQNg6/ViM0Ct7c56xnMxJ8IqLhEsVLRVDMpnCZ
	 mtai2MpgIGo5mD90JuHR3D/tfisZ6K5U4emfvpeth6RQjsy1RcuW0hlkdXuxYORgLWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Wmcf4mViIOBztFuD7lQQZhUYPulduXRhG7H996WEMdo=;
	b=uoJEYUVkgUWPjw6GvvoC/++TZ2HTDlzNieOrcL/usj+pJAf51J6ClobvBG6OLPPy45MR
	 /+izSoSMlTADyFylE7WHS8mwCBMCID/hBrquVDHFicjw4n6MQg0mTzSQSoe2bDDyx+eUt
	 0LfWUIyc3I+ibB3537g5V6B4gjhg5w9vPWael1KQYx/5fL62sIIxJRxzZ0WEAKut5mrO2
	 yBaVuztbTFq5zu7mwkt6C/AvbGSLvgIieXFSpSW7NvoggT6TA4Hs6Ll/9/0Kqum0Zmvrm
	 8Dxpulvs3oh+CGpVLbQ3Fpzm7r+JFgRN98VCCHj9eF9aRLcNxTlyWvc8WrRiokXD8lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwKbNyAE;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAAB606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FAAB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwKbNyAE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so1158265e9.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953479; x=1795558279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wmcf4mViIOBztFuD7lQQZhUYPulduXRhG7H996WEMdo=;
        b=xwKbNyAEpGluQH9rvCPzjJLKmdbHwziqyoXJmimHR8b0x4UT5So9NotetuoXq5Gaaz
         jQ7a165cGDY5qq75zgEEKil8MWCxOK1096rbl2u/ScaYAsKz85XNma7zgkJpUy3EBZ9s
         OqB6QQAgR22FEjOpHtaQ4vFzDCwkBeKcg7irDTAGUwISRzagKGoUUQge9YN/GcwfMZPD
         E/+KNCWWx5of8Gn3hy94sVncAekUANIDhXUSwL599wRlg8mpmmmc4mCD/LRROOYgNY6h
         3DyGNpLQXzxGCuLaryJPuXz7xqKj8seO2HFqvo0xYtIWKEWGcvIV3sqlFGFaXQv/jLna
         SN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953479; x=1795558279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wmcf4mViIOBztFuD7lQQZhUYPulduXRhG7H996WEMdo=;
        b=CbquxbhY3Omy1YDR+ogoRThMjYeADSh1MtSjFKHkUUAyRdTcz8bLaPmRcCOHmX1jb1
         knMWjsGblxW1H1iugPwHrynQb8Juz5pXu2zVSpZ5Vp7LpDs0Pg4Oym7S/QsMW2gQUTrb
         2KQp54lFPwAYtet8FXWjkh0im2dmTyW6vxDyLggTHGvBQn7r3tQzHjpSxJqtwqnuIrXG
         D27FLbiVenfoyxbuk48RacqDGzu9EEl5syUxxdnBLA9B639GwGTKE6S/wLBnrh8k8bjM
         W5bdVeA0pxaoLCbVYunoDlyGU7hwmAPW5oRJ7odxhs5aQ/dRU6UIo/h9BopmTDDtGQWw
         jrIw==
X-Gm-Message-State: APuU4Z8J05PYd1UFEIgjIvmY0MCWGL8AwqGJTKsCa7zVyCY0U9uP2nyd
	pnIcw3jWJ6/SDbg7+tkx5uPnKTid10CCIP99WGf7L9SK9GzqWejJB20u
X-Gm-Gg: AYBFou0iZjdYmxrZWNiySwQVDV5vKFYFrqN+DmzPei19qkHvZq2nU1nQQ9iK4bwI3/i
	/TDQ84nYVRaIwKjIVSeuUAwIHrmhfbJRuKscsH76aIjMLzkNU2BS8IpYXQAclP9ij4W5GmWKRB5
	vsWmtkfekaNJ1/CRjvygTPSEmnHkPR63n4m/GLukaY3yLyEDYUypvSlTVX7xYxq1Z2Qlb2aXYGP
	8hfQa3VVsorhsuVrOEKjzAi8tIvWROIR9UohfvXKJYD5BcL6jz0kAerQEvAIr+5zw291iVNP30E
	EMKh1f187KwhLA/LKGVXsYaXYUVQPVvSpE+4kXQ7jzJ2/h8fPtaO76av0UEaJyigzqTJnhPbrco
	x5S/44hlvjGXGioUuUezqOzTyE627QDnb5GRlZCR1FDrP0RqTxatZsnBCJ/6zBeUwSbFk2E7Eig
	kSe7z6Sr96EdFcwPmUfckzWGHFFTB5OLiafVnm39ahAuiXRFtOAXeCG6e3XPeO+pAL2zXkttL/R
	MIIgfdbssmGqx8e5bhgHxbRitN9DqCjr343h08j2sol42L/8vDuv4MmvHUNiXXmFREKppSihIzp
	GstowkdCh491U/U1J6W/f8O5hk2gSgp0xX5tWck/Si11f5fn9CfTkD8jyJyfoz2QXq4aovP78TG
	/dEGzk8zZhxxHwwpX6m4teac3uIAFH3hWgBBcuDeM
X-Received: by 2002:a05:600c:a013:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb7d57749dmr12502495e9.0.1794953479148;
        Tue, 17 Nov 2026 14:11:19 -0800 (PST)
Received: from laptop.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78346f4asm99960585e9.0.2026.11.17.14.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:11:18 -0800 (PST)
Date: Wed, 18 Nov 2026 00:10:32 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, wellslutw@gmail.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <uscwfcie3wlbyljcowjvwhto7aecdid7cxjknvd4t6t4fyj5tt@lpyoijsxuduk>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
 <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
 <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>

On 16 Nov 23:19, Andrew Lunn wrote:
>> I am fairly confident the change is correct, as the documentation
>> supports it.
>
>So the LLM review is wrong?

No, the review is not wrong. It correctly points out that the budget
cannot be exhausted during normal NAPI polling in this driver, which
I had missed originally.

It correctly identifies that the old code unmasks interrupts even
when napi_complete() returns false. My change calls napi_complete_done()
before unmasking interrupts and only unmasks them if it returns true,
indicating that NAPI polling has completed and interrupts can be re-enabled.

Finally, it brings up some pre existing issues that seem to be appropriate
for separate patches.

If this patch still makes sense as a net-next change, I will update the commit 
message to explain the ordering and conditional interrupt masking.

Best regards,
Janis
