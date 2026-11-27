Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764270;
	b=Z2BrFA+C377G+Nnzpyg8BEDcASswMr7GnR9gCx5EwdwLUEYhu00fdXe2I0+sbfXbiqrp
	 MgImSLwK1jE+UAkejByDw9XTCKpZeDEKohMdIhYOu2+4mR4av8izxYtdxZqrvdZHwZraX
	 ayqOtJcF/KD0ok3yI2LcNtm5b5NVyiIt/Tr8yNOa3eEadtOInygkyu4sNm5Ei6cdm+3bf
	 danb7zsyYfH/ELsJmdASjmBmTY7Fh3t/M1npy1m83XdUmX/oFhKYCobfls1wuOD+PSszT
	 vEEkMrtGRId73w+kud633NcGhZhg9DzIzPY71HskMs1Q9luW/4su3KSeSknkMYJn8tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764270;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=PKggmJsyOuPDJQGm3PptcVBopoBVz/uHczta3yA559o=;
	b=bFRyIwk4OEJzEIMjnRd82OzEWfLX8s0DDHSkVdCY3RWsTU8r5tAYN5kQi36wKOiDf3F6
	 RZqbqhYKX3/ZAN+5b9MwT/4lv2+iMZZOSiGlM74l0ecW3jdsvqsDuOCLRfu1HfEEKBcSc
	 L542X49nIAVR9zQYfch5BRibEozSvN2nmKRFwOZR/x60JiqB521gviOt44zd4N1JtEJLL
	 EKE7TMOK4mTIEIwv3s6iv+9e+F0LyuEb68abPQPpSivYqzA+o21fxqDLfzn32JofwVHcX
	 zxtbZhySRP2I6O/k8lznDGDON0+XOytHCTX4NePnHCWI0It7uCEFZCpFYy2KDnUXT9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1F2606A31C;
	Fri, 27 Nov 2026 07:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D1F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	Content-Transfer-Encoding; bh=PKggmJsyOuPDJQGm3PptcVBopoBVz/uHcz
	ta3yA559o=; b=vJGDFlbK0rI9n90VXg2usTHlE3iwJsFrqg44cedUXy9LELau5a
	TgOpd92pEbRv+gZcsasnk1aKZoChs04/TWW9b8eDRJYGYlN9VBKRT9SpvDwIcFHh
	XaXUeu7oXbxf+TN6HnMt3wm67+sYIZ14OBeM+C1cKYLVcljQ3IN2rsmrk=
Received: from user-virtual-machine.localdomain (unknown [113.200.174.43])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkBWdfsnMAlr+ttRAg--.37855S2;
	Fri, 27 Nov 2026 15:24:24 +0800 (CST)
From: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
To: netdev-bot+sashiko@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v2] net: ethtool: do not call get_regs() for zero-length dumps
Date: Fri, 27 Nov 2026 15:24:23 +0800
Message-Id: <20261127072423.5386-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179574730769.3135.6060942775562840087@kernel.org>
References: <20261126015239.6038-1-25031212351@stu.xidian.edu.cn> <179574730769.3135.6060942775562840087@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BrQMCkBWdfsnMAlr+ttRAg--.37855S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr4UCFWfGFWfXF4DXw48Xrb_yoWkZwbE9r
	W7ZrnxWr1DXF9rXr1DCry7Zry3tFyUWFs7XrWUKryft34SyFyxWFsYvwnYgFyxJaykWr1k
	CrnxX39Fkw1avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6kYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8I
	j28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF
	1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxG
	rwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF
	4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU2cdjDUUUU
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUKD2sITcuTUgAAsm

On Fri, Nov 27, 2026 at 02:41:47AM +0000, netdev-bot+sashiko@kernel.org wrote:
> [Medium] Can this early return hide errors from get_regs_len()?
>
> [Low] For drivers whose get_regs_len() returns a positive value, does
> this change what a len == 0 query returns in regs.version?

Both points are valid.

The Medium one is a real regression.  ethtool -d sends a zero-length
request exactly when ETHTOOL_GDRVINFO reported no regdump_len, which is
what happens when get_regs_len() fails, so the early return would hide
-EOPNOTSUPP from DSA user ports and hns3.  I moved the zero-length check
after the get_regs_len() result check; only drivers which report a
positive length skip the callback now.

For the Low one, a zero-length dump returns no data and, with the
callback skipped, it no longer fills in regs.version.  I documented that
in the commit message: the uAPI points users at ETHTOOL_GDRVINFO for the
size, and ethtool(8) always sends regdump_len for drivers that report
one, so there is no version-only query to preserve.

v4 posted separately:
https://lore.kernel.org/r/20261127072348.5277-1-25031212351@stu.xidian.edu.cn/

pw-bot: cr

