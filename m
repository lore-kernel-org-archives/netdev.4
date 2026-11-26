Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683076;
	b=hIhAtHe/4lqheF6Zdfh9RR/9zlgP8i72GZsASvfP56kb4AsqHgCnqiD20t3k5mP8lTZK
	 Usy5dQqFYaPdCYtGfwvXAqLs4sRNlM4XGBrez6Ut1zHAIHOfRTm78cmKJGyrL6RUiC2Gt
	 B1eNxI7hvalTa0bTsnUQl0F26+cXWzD8k86jZrS8ObC6cq9Y17vbuFpS5rnnU6fWskU51
	 EU4iXonivrvXdBg/dKoeI65LHmLQZsE0NsMPWt59U6isQhZj6MNWwLkdEc2NbtbF27Ih0
	 JokrZxafD8a5rUvQdL6uv1U9D052TYPKGV9LEOtkTV3BYcjh4fmpZn3jVEbSCowhfXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683076;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4KgaJB5jGrUq7vsExVtlIWM7Dg+xBJA26WB8v2wHqu8=;
	b=ttQKVEjJ6tmUwzjL/C/WvuFBHNtRsuao2tCFVYJkUSNMWiWdDrBXDD5M5xhkfXsccDJw
	 7XzLQajPgrhwdTbamXkA178uJquWTnZJMlbPAWJ8ta4OsLlraJkOEMUJOP/exgozXPJ7B
	 R8BzoInqWgO1U1huNaLfAfyP/AOhUxHblMI/g6Yw/1yVRhUxArIKDRkwkxviAq0Cy0Aap
	 /b3mNogPR2HAqK0SdkqfWkWC1PvzYo7bKPAnq796HHCwclI86n3dxqDh9FMthRqz+NZIh
	 GXSOU3YSCGJXaLhjqJzQ5KzIFI14/9S9B2x6q7C4HOcQW6BOD81ZlQLc/HP9X8+AuGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FRKbaUW1;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="f/YODFxl";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC068606A326
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC068606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FRKbaUW1;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=f/YODFxl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795683074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4KgaJB5jGrUq7vsExVtlIWM7Dg+xBJA26WB8v2wHqu8=;
	b=FRKbaUW1yLtumX1IVyRfQEZqSTrI2WIv8VHtuj2ThA3qCcQWqNzxttgcgrKzjr0SVa/GXd
	+UCOpoI2eT3EDkYtwiePjfUTqcKuTT/jDIBhK2cPfDIm93kbgsFd6pxbOMyrf2lVhZnfTN
	oRwDNZMgSa1G5Gk5FDxKTHhhZIT6NN4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-GvWWlorMMvmo4SPr5-9YRQ-1; Thu, 26 Nov 2026 08:51:12 +0000
X-MC-Unique: GvWWlorMMvmo4SPr5-9YRQ-1
X-Mimecast-MFC-AGG-ID: GvWWlorMMvmo4SPr5-9YRQ_1795683071
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e29c25101so2962733f8f.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795683071; x=1796287871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KgaJB5jGrUq7vsExVtlIWM7Dg+xBJA26WB8v2wHqu8=;
        b=f/YODFxlKhNJ0Xj/u7qqXhIExHy/NSqq6zYtYMNTyhIsfTmOsH4QhjZu3pItWtY7IL
         l0aNqJmPd3U519+ehI84/K13X221xF3ooI/bmvfiSQrtMPfCQmq03fv5v9GUXccuPl5+
         a/L4PUjs1FinHNgurNCwTPwOAIy5LFBBS1n4Rv63vLSCrqiXhKrWjWExr99uqz2bXPxq
         mEmBtwQjJKHIkksKQUEGoifPXV2W4W0JBj7eDQySHBp7j4f8JldQ/gh3eITVNvPbfNfZ
         h3baLLq7v0YMCXSqUg5RwAfB6HWFsb47G9PAzJcURxkBVGVc3aknYCIvOGngKtZPwh+k
         opBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683071; x=1796287871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KgaJB5jGrUq7vsExVtlIWM7Dg+xBJA26WB8v2wHqu8=;
        b=ma5V25exkVfgkd/bK+K3Yh8IRsBcyB2UKYYupllYKjjoyLa948v1CjMQ51xGj+b8oO
         mFl+XipYTeTtAR04RyPQtueT5mt1SkB1TKOpK2aVBOViAjwF4i9JXCp3qp9SSSYcGwyL
         vEyIGme7myXM8IPNrRDRLFxWOSpmF2A/E6LwMz0HiIdAIqTfLYfiV9NMpYYzGBA91AYZ
         H4O9EB5je7oGR278ea+mAzH2QUllRPQwuPofqLbx+RHLEHFuU9TL0UqfDwZe60EneTX3
         NtIarYiu5308ymv3dAi2bg5PENCjKTiQcjZNIl43bPY8ryVt1rMr2eSxER3lVQ0yhidE
         vAMg==
X-Gm-Message-State: APuU4Z8CzY5ahsqzlz9/9iE7IMzbJiCZm7L1WKr7HanZp84GJ4iyEFmD
	heIRIg2NEQLtjks45YvXZGy2IvPImI0Dx442fSFNS+JXtxBvuEmbf1DiRmKF5TRxFgX5I4GOm10
	6J3TIntjQniNTeEyLtAoP3RzrjAJL+NVj3CH64yCH6eVbC8O5rqH1Vbqd9g==
X-Gm-Gg: AZFdTZdNiB/kdptWYbV1PrdlQRpD4Cs+WXZWg8xMX/ObLHu7aa/ctlTjtq12s/BMmzO
	xdzrOk9I1UJie4CXH1S1uTLk4NcpDKspGwFjZMbbljmG7Ai4dJEU9zJXmkwiSFeCiayPYUzq0bv
	8RhMOob5X/+fMJE/WmXKd2XqY2AlysNtMGykJp8hjsBh8evMlxSXuCrXhyf0Y+KRlqL7FfRoMZ3
	9PcBFTJAkmhakdUg8yQVMpIYfO5nADAgbHjpqW8q3rXM/sCTzmGm4SLO0vEqUuwYl8Y5Xv5ltyq
	KsXt/2JDUWWGW7scaawuG7YPajHiXCyhkxS96TTYV5H+NJCMEKAIr89GyXopxmOZq715XwtBJ4Z
	TmTP8C1NCSDrOgsNkrd6+a4EhuPZC9HSK6SyiJkNU2fIMFCKSyTxsC9Wysw/9KYvOl/mDFbGNRq
	h+LBiym/ajKcElKHLeqCUKm0h0Wmv5aGFR3b+hqZW1zz2A
X-Received: by 2002:a5d:6691:0:b0:4a6:c3f:9d0e with SMTP id ffacd0b85a97d-4abb3d2c0bemr28772247f8f.44.1795683071374;
        Thu, 26 Nov 2026 00:51:11 -0800 (PST)
X-Received: by 2002:a5d:6691:0:b0:4a6:c3f:9d0e with SMTP id ffacd0b85a97d-4abb3d2c0bemr28772196f8f.44.1795683070961;
        Thu, 26 Nov 2026 00:51:10 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm37852308f8f.56.2026.11.26.00.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:51:10 -0800 (PST)
Message-ID: <d3555d86-a7a9-4ff8-9e23-04bb3e351de7@redhat.com>
Date: Thu, 26 Nov 2026 09:51:08 +0100
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
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
To: Tony Nguyen <anthony.l.nguyen@intel.com>, Petr Oros <poros@redhat.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 edumazet@kernel.org, davem@davemloft.net, andrew+netdev@lunn.ch,
 horms@kernel.org, Marcin Szycik <marcin.szycik@linux.intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
 <20261118115915.116177-1-poros@redhat.com>
 <20261125124652.3843638-1-poros@redhat.com>
 <81c519b6-2d94-424e-8cfe-22ed8c1d728b@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <81c519b6-2d94-424e-8cfe-22ed8c1d728b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 22:16, Tony Nguyen wrote:
> On 11/25/2026 4:46 AM, Petr Oros wrote:
>> It would also help if Intel updated the MAINTAINERS entry to match and
>> kept it up to date, so that it is clear who acks fixes for each driver.
>> Jakub mentioned adding maintainers or splitting the entry, and the
>> details would be for Intel to decide.
> Yes, we plan on making updates to that file
> 
> For netdev maintainers: Is a Reviewer: entry sufficient to be taken directly?
Double checking I'm reading the question correctly; let me rephrase it:

A 3rd party sends a patch/series to netdev. Someone @intel, listed as reviewer
in the MAINTAINERS file acks it. Can we accept such patch/series?

The answer is yes, if we (net maintainers and intel) agree on this process
definitely an ack from intel reviewer would be enough.

Please LMK if I misread the question.

/P

